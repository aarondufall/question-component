module QuestionComponent
  class Question
    include Schema::DataStructure

    attribute :id, String
    attribute :title, String
    attribute :details, String
    attribute :tags, Array
    attribute :asked_time, Time
    attribute :answers, Array, default: []

    def asked?
      !asked_time.nil?
    end

    def answer(id, body, answered_time)
      answer = Answer.build
      answer.id = id
      answer.body = body
      answer.answered_time = answered_time
      answers << answer
    end
  end
end
