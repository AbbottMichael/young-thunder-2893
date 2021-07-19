require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')

    visit "/movies/#{@raiders.id}"
  end

  it "displays the movie's title, creation year and genre" do
    expect(page).to have_content(@raiders.title)
    expect(page).to have_content(@raiders.creation_year)
    expect(page).to have_content(@raiders.genre)
  end

  it "displays a list of all its actors from youngest to oldest"

  it "displays the average age of all of the movie's actors"

end
