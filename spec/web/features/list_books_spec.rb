require 'features_helper'

describe 'List books' do
  let(:repository) { BookRepository.new }

  before do
    repository.clear

    repository.create(title: 'PoEAA', author: 'Martin Fowler')
    repository.create(title: 'TDD',   author: 'Kent Beck')
  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      expect(page.has_css?('.book', count: 2)).to be_truthy
    end
  end
end