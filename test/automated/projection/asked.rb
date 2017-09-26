require_relative '../automated_init'

context "Projection" do
  context "Asked" do
    question = Controls::Question::New.example

    assert(question.asked_time.nil?)

    asked = Controls::Events::Asked.example

    profile_id = asked.profile_id or fail
    question_id = asked.question_id or fail
    title = asked.title or fail
    details = asked.details or fail
    tags = asked.tags or fail

    Projection.(question, asked)

    test "ID is set" do
      assert(question.id == question_id)
    end

    test "Title is set" do
      assert(question.title == title)
    end

    test "Details is set" do
      assert(question.details == details)
    end

    test "Tags is set" do
      assert(question.tags.first == tags.first)
    end
 
    test "Asked time is converted and copied" do
      asked_time = Time.parse(asked.time)

      assert(question.asked_time == asked_time)
    end
  end
end
