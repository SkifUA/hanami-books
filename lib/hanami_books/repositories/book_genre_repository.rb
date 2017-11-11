class BookGenreRepository < Hanami::Repository
  associations do
    belongs_to :book
    belongs_to :genre
  end
end
