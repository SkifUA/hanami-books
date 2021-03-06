RSpec.describe Web::Views::Books::Index, type: :view do
  let(:exposures) { Hash[books: []] }
  let(:repository) { BookRepository.new }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #books' do
    expect(view.books).to eq exposures.fetch(:books)
  end

  describe 'when there are no books' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">There are no books yet.</p>')
    end
  end

  describe 'when there are books' do
    let(:book1)     { repository.create(title: 'Refactoring', author: 'Martin Fowler') }
    let(:book2)     { repository.create(title: 'Domain Driven Design', author: 'Eric Evans') }
    let(:exposures) { Hash[params: [],books: [repository.find(book1.id), repository.find(book2.id)] ]}

    it 'lists them all' do
      expect(rendered.scan(/class="book"/).count).to eq 2
      expect(rendered).to include('Refactoring')
      expect(rendered).to include('Domain Driven Design')
    end

    it 'hides the placeholder message' do
      expect(rendered).not_to include('<p class="placeholder">There are no books yet.</p>')
    end
  end
end