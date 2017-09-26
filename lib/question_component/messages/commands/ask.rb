module QuestionComponent
  module Messages
    module Commands
      class Ask
        include Messaging::Message

        attribute :question_id, String
        attribute :profile_id, String
        attribute :title, String
        attribute :details, String
        attribute :tags, Array
        attribute :time, String
      end
    end
  end
end
