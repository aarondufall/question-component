module QuestionComponent
  class Store
    include EntityStore

    category :question
    entity Question
    projection Projection
    reader MessageStore::Postgres::Read
  end
end
