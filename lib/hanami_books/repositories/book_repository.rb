class BookRepository < Hanami::Repository
  associations do
    has_many :book_genres
    has_many :genres, through: :book_genres
  end

  def find_with_genres(id)
    aggregate(:genres).where(id: id).map_with(Book).one
  end

end
