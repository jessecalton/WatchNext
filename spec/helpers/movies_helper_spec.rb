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
  before(:context) do
    @user = FactoryBot.create(:user_with_movies)
    @movie_1 = FactoryBot.create(:movie_1)
    @movie_2 = FactoryBot.create(:movie_2)
    @movie_3 = FactoryBot.create(:movie_3)
  end


  describe '#runtime_match' do
    it 'returns movies with runtimes less than the user-inputted string' do
      assign(:movie_array, [@movie_1, @movie_2, @movie_3])
      params[:runtime] = "120"
      expect(helper.runtime_match).to match_array([@movie_1, @movie_3])
    end
    it 'creates a new movie array if none exists' do
      assign(:current_user, @user)

      params[:runtime] = "100"
      matched_movie = @user.movies.find_by(title: "WALL-E")
      expect(helper.runtime_match).to be_an(Array)
      expect(helper.runtime_match).to include(matched_movie)
    end
  end

end