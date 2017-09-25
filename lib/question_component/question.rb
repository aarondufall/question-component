module QuestionComponent
  class Question
    include Schema::DataStructure

    attribute :id, String
    attribute :title, String
    attribute :details, String
    attribute :tags, Array
    attribute :asked_time, Time

    def asked?
      !asked_time.nil?
    end
  end
end
