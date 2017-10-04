module QuestionComponent
  module Controls
    module Events
      module Answered
        def self.example
          answered = QuestionComponent::Messages::Events::Answered.build

          answered.question_id = Question.id
          answered.profile_id = Profile.id
          answered.answer_id = Question::Answer.id
          answered.body = Question::Answer.body
          answered.time = Controls::Time::Effective.example
          answered.processed_time = Controls::Time::Processed.example

          answered
        end
      end
    end
  end
end
