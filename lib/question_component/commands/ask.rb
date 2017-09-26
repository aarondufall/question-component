module QuestionComponent
  module Commands
    class Ask
      include Command

      def self.configure(receiver, attr_name: nil)
        attr_name ||= :ask
        instance = build
        receiver.public_send("#{attr_name}=", instance)
      end

      def self.call(question_id: nil, profile_id:, title:, details:, tags: nil, reply_stream_name: nil, previous_message: nil)
        instance = self.build
        question_id = Identifier::UUID::Random.get
        instance.(question_id: question_id, profile_id: profile_id, title: title, details: details, tags: tags, reply_stream_name: reply_stream_name, previous_message: previous_message)
      end

      def call(question_id:, profile_id:, title:, details:, tags: nil, reply_stream_name: nil, previous_message: nil)
        question = self.class.build_message(Messages::Commands::Ask, previous_message)

        question.question_id = question_id
        question.profile_id = profile_id
        question.title = title
        question.details = details
        question.tags = tags
        question.time = clock.iso8601

        stream_name = command_stream_name(question_id)

        write.(question, stream_name, reply_stream_name: reply_stream_name)

        question
      end
    end
  end
end
