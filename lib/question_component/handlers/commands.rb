module QuestionComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Commands
      include Messages::Events

      dependency :write, Messaging::Postgres::Write
      dependency :clock, Clock::UTC
      dependency :store, Store

      def configure
        Messaging::Postgres::Write.configure(self)
        Clock::UTC.configure(self)
        Store.configure(self)
      end

      category :question

      handle Ask do |ask|
        question_id = ask.question_id

        question, version = store.fetch(question_id, include: :version)

        if question.asked?
          logger.info(tag: :ignored) { "Command ignored (Command: #{ask.message_type}, Question ID: #{question_id})" }
          return
        end

        asked = Asked.follow(ask)

        asked.processed_time = clock.iso8601

        stream_name = stream_name(question_id)

        write.(asked, stream_name, expected_version: version)
      end
    end
  end
end
