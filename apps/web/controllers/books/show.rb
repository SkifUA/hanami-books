module Web::Controllers::Books
  class Show
    include Web::Action

    expose :book

    def call(params)
      @book = BookRepository.new.find(params[:id])
    end
  end
end
