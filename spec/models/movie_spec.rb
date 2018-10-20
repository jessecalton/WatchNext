require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { Movie.new(:title => "WALL-E", 
                          :runtime => 98, 
                          :decade => "2000", 
                          :genre => "Animation, Adventure, Family", 
                          :director => "Andrew Stanton", 
                          :actors => "Ben Burtt, Elissa Knight, Jeff Garlin, Fred Willard", 
                          :awards => "Won 1 Oscar. Another 89 wins & 90 nominations.", 
                          :poster_url => "https://images-na.ssl-images-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_SX300.jpg",
                          :rotten_tomatoes => 96)}

  describe 'attributes' do

    it "has a title" do
      expect(movie.title).to eq("WALL-E")
    end

    it "has a runtime that is an integer" do
      expect(movie.runtime).to be_an(Integer)
    end
    
    it "has a Rotten Tomatoes score that is an integer" do
      expect(movie.rotten_tomatoes).to be_an(Integer)
    end

    it "has a Rotten Tomatoes score that is between 0 and 100" do
      expect(movie.rotten_tomatoes).to be_between(0, 100).inclusive
    end
  end
end
