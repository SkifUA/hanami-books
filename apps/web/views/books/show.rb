module Web::Views::Books
  class Show
    include Web::View

    def genres
      book.genres.map { |genre| genre.name }.join(', ')
    end
  end
end
