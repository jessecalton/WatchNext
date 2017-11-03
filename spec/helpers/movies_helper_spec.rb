require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MoviesHelper. For example:
#
# describe MoviesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MoviesHelper, type: :helper do
    let(:user) {User.new(id: 1,
                        :email => "tom@tomtom.com",
                        :username => "tomtom",
                        :password_digest => "tomtom")}
    let(:movie_1) { Movie.new(id: 1,
                          :title => "WALL-E", 
                          :runtime => 98, 
                          :decade => "2000", 
                          :genre => "Animation, Adventure, Family", 
                          :director => "Andrew Stanton", 
                          :actors => "Ben Burtt, Elissa Knight, Jeff Garlin, Fred Willard", 
                          :awards => "Won 1 Oscar. Another 89 wins & 90 nominations.", 
                          :poster_url => "https://images-na.ssl-images-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_SX300.jpg",
                          :rotten_tomatoes => 96,
                          :user_id => user.id)}
    let(:movie_2) { Movie.new(id: 2,
                        :title => "2001: A Space Odyssey", 
                        :runtime => 149, 
                        :decade => "1960", 
                        :genre => "Adventure, Sci-Fi", 
                        :director => "Stanley Kubrick", 
                        :actors => "Keir Dullea, Gary Lockwood, William Sylvester, Daniel Richter", 
                        :awards => "Won 1 Oscar. Another 13 wins & 10 nominations.", 
                        :poster_url => "https://images-na.ssl-images-amazon.com/images/M/MV5BMTZkZTBhYmUtMTIzNy00YTViLTg1OWItNGUwMmVlN2FjZTVkXkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_SX300.jpg",
                        :rotten_tomatoes => 94,
                        :user_id => user.id)}
    let(:movie_3) { Movie.new(id: 3,
                        :title => "Labyrinth", 
                        :runtime => 101, 
                        :decade => "1980", 
                        :genre => "Adventure, Family, Fantasy", 
                        :director => "Jim Henson", 
                        :actors => "David Bowie, Jennifer Connelly, Toby Froud, Shelley Thompson", 
                        :awards => "Nominated for 1 BAFTA Film Award. Another 3 nominations.", 
                        :poster_url => "https://images-na.ssl-images-amazon.com/images/M/MV5BMjM2MDE4OTQwOV5BMl5BanBnXkFtZTgwNjgxMTg2NzE@._V1_SX300.jpg",
                        :rotten_tomatoes => 68,
                        :user_id => user.id)}
  describe '#runtime_match' do
    it 'returns movies with runtimes less than the user-inputted string' do
      assign(:movie_array, [movie_1, movie_2, movie_3])
      params[:runtime] = "120"
      expect(helper.runtime_match).to match_array([movie_1, movie_3])
    end
    # it 'creates a new movie array if none exists' do
    #   assign(:current_user, user)
    #   puts user.movies.to_yaml
    #   params[:runtime] = "120"
    #   expect(helper.runtime_match).to be_an(Array)
    #   expect(helper.runtime_match).to include(movie_1)
    # end
  end

end
