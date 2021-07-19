require 'rails_helper'

RSpec.describe 'Studio index page' do
  before :each do
    @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    @paramount = Studio.create(name: 'Paramount Pictures', location: 'Hollywood')
  end

  it "displays each studio's name and location" do
    visit '/studios'
save_and_open_page
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@universal.location)
    expect(page).to have_content(@paramount.name)
    expect(page).to have_content(@paramount.location)
  end
end
