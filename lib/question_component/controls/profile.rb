module QuestionComponent
  module Controls
    module Profile
      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        1111
      end
    end
  end
end
