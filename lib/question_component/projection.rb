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
  end
end
