module QuestionComponent
  module Controls
    module Question
      def self.example
        question = QuestionComponent::Question.build

        question.id = self.id
        question.title = self.title
        question.details = self.details
        question.tags = self.tags
        question.asked_time = Time::Effective::Raw.example

        question
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        1111
      end

      def self.title
        'some_title'
      end

      def self.details
        'some_detail'
      end

      def self.tags
        ['some_tag']
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
