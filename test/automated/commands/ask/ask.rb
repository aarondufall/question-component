require_relative '../../automated_init'

context "Commands" do
  context "Ask" do
    question_id = Controls::ID.example
    profile_id = Controls::Profile.id
    title = Controls::Question.title
    details = Controls::Question.details
    effective_time = Controls::Time::Effective::Raw.example

    ask = Commands::Ask.new
    ask.clock.now = effective_time

    ask.(question_id: question_id, profile_id: profile_id, title: title, details: details)

    write = ask.write

    ask_message = write.one_message do |written|
      written.instance_of?(Messages::Commands::Ask)
    end

    test "Ask command is written" do
      refute(ask_message.nil?)
    end

    test "Written to the question command stream" do
      written_to_stream = write.written?(ask_message) do |stream_name|
        stream_name == "question:command-#{question_id}"
      end

      assert(written_to_stream)
    end

    context "Attributes" do
      test "question_id is assigned" do
        assert(ask_message.question_id == question_id)
      end

      test "profile_id is assigned" do
        assert(ask_message.profile_id == profile_id)
      end

      test "title is assigned" do
        assert(ask_message.title == title)
      end

      test "details is assigned" do
        assert(ask_message.details == details)
      end

      test "time" do
        effective_time_iso8601 = Clock.iso8601(effective_time)

        assert(ask_message.time == effective_time_iso8601)
      end
    end
  end
end
