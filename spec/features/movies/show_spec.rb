require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @harrison = @raiders.actors.create!(name: 'Harrison Ford', age: 78)
    @karen = @raiders.actors.create!(name: 'Karen Allen', age: 69)
    visit "/movies/#{@raiders.id}"
  end

  it "displays the movie's title, creation year and genre" do
    expect(page).to have_content(@raiders.title)
    expect(page).to have_content(@raiders.creation_year)
    expect(page).to have_content(@raiders.genre)
  end

  it "displays a list of all its actors from youngest to oldest" do
    save_and_open_page
    expect(page).to have_content(@harrison.name)
    expect(page).to have_content(@karen.name)
    expect("Karen Allen").to appear_before("Harrison Ford")

  end

  it "displays the average age of all of the movie's actors" do
    expect(page).to have_content("Average age of all actors: 73.5")
  end

end
