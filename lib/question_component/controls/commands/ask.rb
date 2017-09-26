module QuestionComponent
  module Controls
    module Commands
      module Ask
        def self.example
          ask = QuestionComponent::Messages::Commands::Ask.build

          ask.question_id = Question.id
          ask.profile_id = Profile.id
          ask.title = Question.title
          ask.details = Question.details
          ask.tags = Question.tags
          ask.time = Controls::Time::Effective.example

          ask
        end
      end
    end
  end
end
