require 'rails_helper'

RSpec.describe MovieSearch, type: :model do
  describe '#initialize' do
    context 'search by movie title' do
      it 'returns a response of true from the OMDB API if a valid call is made' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.response).to eq("True")
        end
        VCR.use_cassette('bad_movie', :record => :once) do
          new_movie = MovieSearch.new("qwerty123","","")
          expect(new_movie.response).to eq("False")
        end
      end
      it 'calls #movie_title to get the title of the film' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.movie_title).to eq("Chinatown")
        end
      end
      it 'calls #movie_decade to get the decade of the film' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.movie_decade).to eq(1970)
        end
      end
      it 'calls #movie_runtime to get an integer of the film\'s length in minutes' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.movie_runtime).to be_an(Integer)
          expect(new_movie.movie_runtime).to eq(130)
        end
      end
      it 'calls #movie_genre to get a string of the film\'s genres' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.movie_genre).to be_a(String)
          expect(new_movie.movie_genre).to eq("Drama, Mystery, Thriller")
        end
      end
      it 'calls #movie_director to get a string of the film\'s directors' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.movie_director).to be_a(String)
          expect(new_movie.movie_director).to eq("Roman Polanski")
        end
      end
      it 'calls #movie_actors to get a string of the film\'s main actors' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.movie_actors).to be_a(String)
          expect(new_movie.movie_actors).to eq("Jack Nicholson, Faye Dunaway, John Huston, Perry Lopez")
        end
      end
      it 'calls #movie_poster to get a url string of a .jpg of the film\'s poster art' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.movie_poster).to be_a(String)
          expect(new_movie.movie_poster).to include(".jpg")
        end
      end
      it 'calls #rotten_tomatoes_score to get an integer of the film\'s RottenTomatoes.com score' do
        VCR.use_cassette('chinatown', :record => :once) do
          new_movie = MovieSearch.new("chinatown","","")
          expect(new_movie.rotten_tomatoes_score).to be_an(Integer)
          expect(new_movie.rotten_tomatoes_score).to be(98)
        end
      end
    end
    context 'advanced search' do
      it 'search with title and year to get specific film' do
        VCR.use_cassette('alice', :record => :once) do
          new_movie = MovieSearch.new("alice in wonderland","1951","")
          expect(new_movie.movie_title).to eq("Alice in Wonderland")
          expect(new_movie.movie_decade).to eq(1950)
          expect(new_movie.response).to eq("True")
        end
        VCR.use_cassette('alice2010', :record => :once) do
          new_movie = MovieSearch.new("alice in wonderland","2010","")
          expect(new_movie.movie_title).to eq("Alice in Wonderland")
          expect(new_movie.movie_decade).to eq(2010)
          expect(new_movie.movie_director).to eq("Tim Burton")
          expect(new_movie.response).to eq("True")
        end
      end
      it 'searches with a film\'s IMDB ID number' do
        VCR.use_cassette('spirited', :record => :once) do
          new_movie = MovieSearch.new("","","tt0245429")
          expect(new_movie.movie_title).to eq("Spirited Away")
          expect(new_movie.movie_decade).to eq(2000)
          expect(new_movie.response).to eq("True")
        end
      end
    end
  end
end
