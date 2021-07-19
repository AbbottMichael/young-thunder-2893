require 'rails_helper'

RSpec.describe 'Studio index page' do
  before :each do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @paramount = Studio.create!(name: 'Paramount Pictures', location: 'Hollywood')
    @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
    @interstellar = @paramount.movies.create!(title: 'Interstellar', creation_year: 2014, genre: 'Sci-fi/Adventure')

    visit '/studios'
  end

  it "displays each studio's name and location" do
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@universal.location)
    expect(page).to have_content(@paramount.name)
    expect(page).to have_content(@paramount.location)
  end

  it "displays the titles of all of it's movies under each studio" do
    expect(page).to have_content(@raiders.title)
    expect(page).to have_content(@shrek.title)
    expect(page).to have_content(@interstellar.title)
  end
end
