require_relative '../../automated_init'

context "Commands" do
  context "Answer" do
    question_id = Controls::ID.example
    profile_id = Controls::Profile.id
    answer_id = Controls::Question::Answer.id
    body = Controls::Question::Answer.body
    effective_time = Controls::Time::Effective::Raw.example

    answer = Commands::Answer.new
    answer.clock.now = effective_time

    answer.(question_id: question_id, profile_id: profile_id, answer_id: answer_id, body: body)

    write = answer.write

    answer_message = write.one_message do |written|
      written.instance_of?(Messages::Commands::Answer)
    end

    test "Answer command is written" do
      refute(answer_message.nil?)
    end

    test "Written to the question command stream" do
      written_to_stream = write.written?(answer_message) do |stream_name|
        stream_name == "question:command-#{question_id}"
      end

      assert(written_to_stream)
    end

    context "Attributes" do
      test "question_id is assigned" do
        assert(answer_message.question_id == question_id)
      end

      test "profile_id is assigned" do
        assert(answer_message.profile_id == profile_id)
      end

      test "answer_id is assigned" do
        assert(answer_message.answer_id == answer_id)
      end

      test "body is assigned" do
        assert(answer_message.body == body)
      end

      test "time" do
        effective_time_iso8601 = Clock.iso8601(effective_time)

        assert(answer_message.time == effective_time_iso8601)
      end
    end
  end
end
