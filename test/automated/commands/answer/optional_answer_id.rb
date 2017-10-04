context "Commands" do
  context "Answer" do
    context "Optional Answer ID" do
      question_id = Controls::Question.id
      profile_id = Controls::Profile.id
      body = Controls::Question::Answer.body

      context "Omitted" do
        answer = Commands::Answer.(question_id: question_id, profile_id: profile_id, body: body)

        test "An Id is assigned" do
          refute(answer.answer_id.nil?)
        end
      end

      context "Supplied" do
        answer_id = Controls::Question::Answer.id

        answer = Commands::Answer.(
          question_id: question_id,
          profile_id: profile_id,
          body: body,
        )

        test "ID is assigned to Supplied Id" do
          assert(answer.answer_id = question_id)
        end
      end
    end
  end
end
