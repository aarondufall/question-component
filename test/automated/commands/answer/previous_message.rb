context "Commands" do
  context "Answer" do
    context "Previous Message" do
      previous_message = Controls::Message.example

      question_id = Controls::ID.example
      profile_id = Controls::Profile.id
      body = Controls::Question::Answer.body

      answer = Commands::Answer.new
      answer.clock.now = Controls::Time::Raw.example

      answer.(question_id: question_id, profile_id: profile_id, body: body, previous_message: previous_message)

      write = answer.write

      answer_message = write.one_message do |written|
        written.instance_of?(Messages::Commands::Answer)
      end

      refute(answer_message.nil?)

      test "Answer message follows previous message" do
        assert(answer_message.follows?(previous_message))
      end
    end
  end
end
