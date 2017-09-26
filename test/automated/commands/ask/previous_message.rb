context "Commands" do
  context "Ask" do
    context "Previous Message" do
      previous_message = Controls::Message.example

      question_id = Controls::ID.example
      profile_id = Controls::Profile.id
      title = Controls::Question.title
      details = Controls::Question.details

      ask = Commands::Ask.new
      ask.clock.now = Controls::Time::Raw.example

      ask.(question_id: question_id, profile_id: profile_id, title: title, details: details, previous_message: previous_message)

      write = ask.write

      ask_message = write.one_message do |written|
        written.instance_of?(Messages::Commands::Ask)
      end

      refute(ask_message.nil?)

      test "Ask message follows previous message" do
        assert(ask_message.follows?(previous_message))
      end
    end
  end
end
