Hanami::Model.migration do
  change do
    create_table :book_genres do

      foreign_key :book_id,  :books, null: false, on_delete: :cascade
      foreign_key :genre_id, :genres, null: false, on_delete: :cascade

    end
  end
end
