module QuestionComponent
  class Question
    class Answer
      include Schema::DataStructure

      attribute :id, String
      attribute :body, String
      attribute :answered_time, Time
    end
  end
end
