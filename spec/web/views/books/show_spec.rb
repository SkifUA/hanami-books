RSpec.describe Web::Views::Books::Show, type: :view do
  before do
    @book = BookRepository.new.create(title: 'TDD', author: 'Kent Beck')
  end
  let(:exposures) { Hash[book: @book] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/show.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #book' do
    expect(view.book).to eq exposures.fetch(:book)
  end

  it 'show data book' do
    expect(rendered).to include('TDD')
    expect(rendered).to include('Kent Beck')
  end
end

