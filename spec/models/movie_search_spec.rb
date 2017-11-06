require 'rails_helper'

RSpec.describe MovieSearch, type: :model do
  describe '#initialize' do
    context 'search by movie title' do
      it 'gets a response from the OMDB API when given a movie title' do
        VCR.use_cassette('chinatown', :record => :all) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.movie_title).to eq("Chinatown")
        end
      end
    end
    context 'two movies with same title' do
      it 'search with title and year to get specific film' do
        VCR.use_cassette('alice', :record => :all) do
          new_movie = MovieSearch.new("alice in wonderland","1951","")
          expect(new_movie.movie_title).to eq("Alice in Wonderland")
          expect(new_movie.movie_decade).to eq(1950)
        end
        VCR.use_cassette('alice2010', :record => :all) do
          new_movie = MovieSearch.new("alice in wonderland","2010","")
          expect(new_movie.movie_title).to eq("Alice in Wonderland")
          expect(new_movie.movie_decade).to eq(2010)
          expect(new_movie.movie_director).to eq("Tim Burton")
        end
      end
    end
  end
end
