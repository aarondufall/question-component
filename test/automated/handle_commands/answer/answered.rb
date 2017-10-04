require_relative '../../automated_init'

context "Handle Commands" do
  context "Answer" do
    context "Answered" do
      handler = Handlers::Commands.new

      processed_time = Controls::Time::Processed::Raw.example

      handler.clock.now = processed_time

      answer = Controls::Commands::Answer.example

      question_id = answer.question_id or fail
      profile_id = answer.profile_id or fail
      answer_id = answer.answer_id or fail
      body = answer.body or fail
      effective_time = answer.time or fail

      handler.(answer)

      writer = handler.write

      answered = writer.one_message do |event|
        event.instance_of?(Messages::Events::Answered)
      end

      test "answered Event is Written" do
        refute(answered.nil?)
      end

      test "Written to the question stream" do
        written_to_stream = writer.written?(answered) do |stream_name|
          stream_name == "question-#{question_id}"
        end
      end

      context "Attributes" do
        test "question_id" do
          assert(answered.question_id == question_id)
        end

        test "profile_id" do
          assert(answered.profile_id == profile_id)
        end

        test "answer_id" do
          assert(answered.answer_id == answer_id)
        end

        test "body" do
          assert(answered.body == body)
        end

        test "time" do
          assert(answered.time == effective_time)
        end

        test "processed_time" do
          processed_time_iso8601 = Clock::UTC.iso8601(processed_time)

          assert(answered.processed_time == processed_time_iso8601)
        end
      end
    end
  end
end
