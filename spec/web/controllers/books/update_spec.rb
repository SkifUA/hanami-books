RSpec.describe Web::Controllers::Books::Update, type: :action do
  let(:action) { described_class.new }
  let(:repository) { BookRepository.new }
  before do
    repository.clear
    @book = repository.create(title: 'TDD', author: 'Kent Beck')
  end

  describe 'with valid params' do

    let(:params) { Hash[id: @book.id, book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }

    it 'book before update' do
      book = repository.find(@book.id)

      expect(book.title).to eq('TDD')
      expect(book.author).to eq('Kent Beck')
    end

    it 'updated book' do
      action.call(params)
      book = repository.find(@book.id)

      expect(book.title).to eq(params.dig(:book, :title))
      expect(book.author).to eq(params.dig(:book, :author))
    end

    it 'redirects the user to the book show' do
      response = action.call(params)
      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq "/books/#{@book.id}"
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[id: @book.id, book: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:book, :title)).to eq  ['is missing']
      expect(errors.dig(:book, :author)).to eq ['is missing']
    end
  end
end

