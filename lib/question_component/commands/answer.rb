module QuestionComponent
  module Commands
    class Answer
      include Command

      def self.configure(receiver, attr_name: nil)
        attr_name ||= :ask
        instance = build
        receiver.public_send("#{attr_name}=", instance)
      end

      def self.call(question_id:, profile_id:, answer_id: nil, body:, reply_stream_name: nil, previous_message: nil)
        instance = self.build
        answer_id = Identifier::UUID::Random.get
        instance.(question_id: question_id, profile_id: profile_id, answer_id: answer_id, body: body, reply_stream_name: reply_stream_name, previous_message: previous_message)
      end

      def call(question_id:, profile_id:, answer_id: nil, body:, reply_stream_name: nil, previous_message: nil)
        answer = self.class.build_message(Messages::Commands::Answer, previous_message)

        answer.question_id = question_id
        answer.profile_id = profile_id
        answer.answer_id = answer_id
        answer.body = body
        answer.time = clock.iso8601

        stream_name = command_stream_name(question_id)

        write.(answer, stream_name, reply_stream_name: reply_stream_name)

        answer
      end
    end
  end
end
