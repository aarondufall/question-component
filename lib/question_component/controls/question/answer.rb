module QuestionComponent
  module Controls
    module Question
      module Answer
        def self.example
          answer = QuestionComponent::Question::Answer.build

          answer.id = self.id
          answer.body = self.body
          answer.answered_time = Time::Effective::Raw.example

          answer
        end

        def self.id
          ID.example(increment: id_increment)
        end

        def self.id_increment
          1111
        end

        def self.body
          'some_body'
        end
      end
    end
  end
end
