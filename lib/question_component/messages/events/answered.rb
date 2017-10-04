module QuestionComponent
  module Messages
    module Events
      class Answered
        include Messaging::Message

        attribute :question_id, String
        attribute :profile_id, String
        attribute :answer_id, String
        attribute :body, String
        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end
