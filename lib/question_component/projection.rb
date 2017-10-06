module QuestionComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :question

    apply Asked do |asked|
      SetAttributes.(question, asked, copy: [
        { :question_id => :id },
        :title,
        :details,
        :tags
      ])

      asked_time = Clock.parse(asked.time)

      question.asked_time = asked_time
    end

    apply Answered do |answered|
      answered_time = Clock.parse(answered.time)

      question.answer(answered.answer_id, answered.body, answered_time)
    end
  end
end
