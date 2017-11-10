module Web::Controllers::Books
  class Destroy
    include Web::Action

    def call(params)
      @book = BookRepository.new.delete(params[:id])

      redirect_to routes.books_path
    end
  end
end
