module QuestionComponent
  module Messages
    module Events
      class Asked
        include Messaging::Message

        attribute :question_id, String
        attribute :profile_id, String
        attribute :title, String
        attribute :details, String
        attribute :tags, Array
        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end

