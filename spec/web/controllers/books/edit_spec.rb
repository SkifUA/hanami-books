RSpec.describe Web::Controllers::Books::Edit, type: :action do
  let(:action) { described_class.new }
  let(:repository){ BookRepository.new }

  before do
    repository.clear

    @book = repository.create(title: 'TDD', author: 'Kent Beck')
  end

  let(:params) { Hash[id: @book.id] }


  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes book' do
    action.call(params)
    expect(action.exposures[:book]).to eq @book
  end
end
