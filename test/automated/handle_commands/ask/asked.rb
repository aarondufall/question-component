require_relative '../../automated_init'

context "Handle Commands" do
  context "Ask" do
    context "Asked" do
      handler = Handlers::Commands.new

      processed_time = Controls::Time::Processed::Raw.example

      handler.clock.now = processed_time

      ask = Controls::Commands::Ask.example

      question_id = ask.question_id or fail
      profile_id = ask.profile_id or fail
      title = ask.title or fail
      details = ask.details or fail
      tags = ask.tags or fail
      effective_time = ask.time or fail

      handler.(ask)

      writer = handler.write

      asked = writer.one_message do |event|
        event.instance_of?(Messages::Events::Asked)
      end

      test "Asked Event is Written" do
        refute(asked.nil?)
      end

      test "Written to the question stream" do
        written_to_stream = writer.written?(asked) do |stream_name|
          stream_name == "question-#{question_id}"
        end
      end

      context "Attributes" do
        test "question_id" do
          assert(asked.question_id == question_id)
        end

        test "profile_id" do
          assert(asked.profile_id == profile_id)
        end

        test "title" do
          assert(asked.title == title)
        end

        test "details" do
          assert(asked.details == details)
        end

        test "tags" do
          assert(asked.tags == tags)
        end

        test "time" do
          assert(asked.time == effective_time)
        end

        test "processed_time" do
          processed_time_iso8601 = Clock::UTC.iso8601(processed_time)

          assert(asked.processed_time == processed_time_iso8601)
        end
      end
    end
  end
end
