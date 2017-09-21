module QuestionComponent
  module Controls
    module Question
      def self.example
        question = QuestionComponent::Question.build

        question.id = self.id
        question.something_happened_time = Time::Effective::Raw.example

        question
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        1111
      end

      module New
        def self.example
          QuestionComponent::Question.build
        end
      end

      module Identified
        def self.example
          question = New.example
          question.id = Question.id
          question
        end
      end
    end
  end
end
