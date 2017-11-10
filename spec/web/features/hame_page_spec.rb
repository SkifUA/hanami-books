require 'features_helper'

describe 'Visit home' do
  it 'is successful' do
    visit '/'

    expect(page).to have_content('Home page')
  end
end