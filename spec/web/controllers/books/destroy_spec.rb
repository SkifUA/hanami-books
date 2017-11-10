RSpec.describe Web::Controllers::Books::Destroy, type: :action do
  let(:action) { described_class.new }
  let(:repository) { BookRepository.new }
  before do
    repository.clear
    @book = repository.create(title: 'TDD', author: 'Kent Beck')
  end

  it 'updated book' do
    action.call(id: @book.id)
    book = repository.find(@book.id)

    expect(book).to be_nil
  end
end
