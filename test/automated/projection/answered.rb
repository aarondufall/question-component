require_relative '../automated_init'

context "Projection" do
  context "Answered" do
    question = Controls::Question::New.example

    assert(question.answers.empty?)

    answered = Controls::Events::Answered.example

    profile_id = answered.profile_id or fail
    question_id = answered.question_id or fail
    answer_id = answered.answer_id or fail
    body = answered.body or fail

    Projection.(question, answered)

    answer = question.answers.first

    test "ID is set" do
      assert(answer.id == answer_id)
    end

    test "Body is set" do
      assert(answer.body == body)
    end
 
    test "Answered time is converted and copied" do
      answered_time = Time.parse(answered.time)

      assert(answer.answered_time == answered_time)
    end
  end
end
