require_relative '../../automated_init'

context "Commands" do
  context "Ask" do
    question_id = Controls::ID.example
    profile_id = Controls::Profile.id
    title = Controls::Question.title
    details = Controls::Question.details

    reply_steam = 'someReplyStream'

    ask = Commands::Ask.new

    ask.(question_id: question_id, profile_id: profile_id, title: title, details: details, reply_stream_name: reply_steam)

    write = ask.write

    ask_message = write.one_message do |written|
      written.instance_of?(Messages::Commands::Ask)
    end

    refute(ask_message.nil?)

    test "Reply stream is set" do
      assert(ask_message.metadata.reply_stream_name == reply_steam)
    end
  end
end
