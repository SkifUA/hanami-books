module Web::Controllers::Books
  class Create
    include Web::Action

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
        optional(:summary)
      end
    end

    def call(params)
      if params.valid?
        BookRepository.new.create(params[:book])

        redirect_to routes.books_path
      else
        self.status = 422
      end
    end
  end
end