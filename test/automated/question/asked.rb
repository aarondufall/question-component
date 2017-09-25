require_relative '../automated_init'

context "Question" do
  context "Has Asked Time" do
    question = Controls::Question.example

    test "Is asked" do
      assert(question.asked?)
    end
  end

  context "Does not Have Opened Time" do
    question = Controls::Question::New.example

    test "Is not asked" do
      refute(question.asked?)
    end
  end
end
