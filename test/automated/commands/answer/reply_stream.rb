require_relative '../../automated_init'

context "Commands" do
  context "Answer" do
    question_id = Controls::ID.example
    profile_id = Controls::Profile.id
    body = Controls::Question::Answer.body
    details = Controls::Question.details

    reply_steam = 'someReplyStream'

    answer = Commands::Answer.new

    answer.(question_id: question_id, profile_id: profile_id, body: body, reply_stream_name: reply_steam)

    write = answer.write

    answer_message = write.one_message do |written|
      written.instance_of?(Messages::Commands::Answer)
    end

    refute(answer_message.nil?)

    test "Reply stream is set" do
      assert(answer_message.metadata.reply_stream_name == reply_steam)
    end
  end
end
