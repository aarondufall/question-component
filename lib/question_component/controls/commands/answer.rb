module QuestionComponent
  module Controls
    module Commands
      module Answer
        def self.example
          answer = QuestionComponent::Messages::Commands::Answer.build

          answer.question_id = Question.id
          answer.profile_id = Profile.id
          answer.answer_id = Question::Answer.id
          answer.body = Question::Answer.body
          answer.time = Controls::Time::Effective.example

          answer
        end
      end
    end
  end
end
