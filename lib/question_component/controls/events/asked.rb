module QuestionComponent
  module Controls
    module Events
      module Asked
        def self.example
          asked = QuestionComponent::Messages::Events::Asked.build

          asked.question_id = Question.id
          asked.profile_id = Profile.id
          asked.title = Question.title
          asked.details = Question.details
          asked.tags = Question.tags
          asked.time = Controls::Time::Effective.example
          asked.processed_time = Controls::Time::Processed.example

          asked
        end
      end
    end
  end
end
