module Web::Controllers::Books
  class Update
    include Web::Action

    params do
      required(:id).filled(:int?)
      required(:book).schema do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
        optional(:summary)
      end
    end

    def call(params)
      if params.valid?
        BookRepository.new.update(params[:id], params[:book])

        redirect_to routes.book_path(params[:id])
      else
        self.status = 422
      end
    end
  end
end
