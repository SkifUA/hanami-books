RSpec.describe Web::Views::Books::Edit, type: :view do
  before do
    @book = BookRepository.new.create(title: 'TDD', author: 'Kent Beck')
    @errors = OpenStruct.new(valid?: false, error_messages: ['Title must be filled', 'Author must be filled'])
  end

  let(:exposures) { Hash[params: @errors, book: @book] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/edit.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  # todo
  it 'displays list of errors when params contains errors' do
    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include('Title must be filled')
    expect(rendered).to include('Author must be filled')
  end

  it 'exposes #book' do
    expect(view.book).to eq exposures.fetch(:book)
  end
end

