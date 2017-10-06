require_relative '../automated_init'

context "Question" do
  context "Answer" do
    question = Controls::Question.example
    answer_id = Controls::Question::Answer.id
    body = Controls::Question::Answer.body
    answered_time = Controls::Time::Effective::Raw.example

    question.answer(answer_id, body, answered_time)

    test "Add New Answer" do
      assert(!question.answers.empty?)
    end
  end
end
