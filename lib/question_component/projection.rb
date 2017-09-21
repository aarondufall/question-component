module QuestionComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :question

    # TODO Implement event projection blocks
    # eg:
    # apply SomethingHappened do |something_happened|
    #   SetAttributes.(question, something_happened, copy: [
    #     { :question_id => :id }
    #   ])

    #   something_happened_time = Clock.parse(something_happened.time)

    #   question.something_happened_time = something_happened_time
    # end
  end
end
