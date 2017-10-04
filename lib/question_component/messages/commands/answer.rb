module QuestionComponent
  module Messages
    module Commands
      class Answer
        include Messaging::Message

        attribute :question_id, String
        attribute :profile_id, String
        attribute :answer_id, String
        attribute :body, String
        attribute :time, String
      end
    end
  end
end
