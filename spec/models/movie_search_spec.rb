require 'rails_helper'

RSpec.describe MovieSearch, type: :model do
  describe '#initialize' do
    it 'gets a response from the OMDB API' do
      VCR.use_cassette 'vertigo' do
        api_key = ENV["API_KEY"]

        @movie_data = JSON.load(open("http://www.omdbapi.com/?t=vertigo&apikey=#{api_key}"))
        expect(@movie_data["Title"]).to eq("Vertigo")
      end
    end
  end
end
