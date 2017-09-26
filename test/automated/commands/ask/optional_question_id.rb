context "Commands" do
  context "Ask" do
    context "Optional Question ID" do
      profile_id = Controls::Profile.id
      title = Controls::Question.title
      details = Controls::Question.details

      context "Omitted" do
        ask = Commands::Ask.(profile_id: profile_id, title: title, details: details)

        test "An Id is assigned" do
          refute(ask.question_id.nil?)
        end
      end

      context "Supplied" do
        question_id = Controls::ID.example

        ask = Commands::Ask.(
          question_id: question_id,
          profile_id: profile_id,
          title: title,
          details: details
        )

        test "ID is assigned to Supplied Id" do
          assert(ask.question_id = question_id)
        end
      end
    end
  end
end

