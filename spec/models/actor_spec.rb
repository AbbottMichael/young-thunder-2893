require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through(:movie_actors) }
  end

  describe 'methods' do
    before :each do
      @harrison = Actor.create!(name: 'Harrison Ford', age: 78)
      @karen = Actor.create!(name: 'Karen Allen', age: 69)
    end

    it 'sorts by age' do
      expect(Actor.all.sort_by_age).to eq([@karen, @harrison])
    end

    it 'returns the average age' do
      expect(Actor.all.average_age).to eq(73.5)
    end
  end
end
