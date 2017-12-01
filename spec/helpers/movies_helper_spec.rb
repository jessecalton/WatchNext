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
    @movie_1 = FactoryBot.create(:movie_1) # WALL-E
    @movie_2 = FactoryBot.create(:movie_2) # 2001 A Space Odyssey
    @movie_3 = FactoryBot.create(:movie_3) # Labyrinth
  end

  describe '#runtime_match' do
    it 'returns movies with runtimes less than the user-inputted string' do
      assign(:movie_array, [@movie_1, @movie_2, @movie_3])
      params[:runtime] = "120"
      expect(helper.runtime_match).to match_array([@movie_1, @movie_3])
    end
    it 'creates a new instance of @movie_array if none exists' do
      assign(:current_user, @user)
      params[:runtime] = "100"
      matched_movie = @user.movies.find_by(title: "WALL-E")
      expect(helper.runtime_match).to be_an(Array)
      expect(helper.runtime_match).to include(matched_movie)
    end
    it 'returns no movies if user-inputted runtime is less than any movie runtimes' do
      assign(:current_user, @user)
      params[:runtime] = "60"
      expect(helper.runtime_match.length).to eq(0)
    end
  end

  describe '#director_match' do
    it 'returns movies directed by the user\'s choice of director' do
      assign(:movie_array, [@movie_1, @movie_2, @movie_3])
      params[:director] = "Stanley Kubrick"
      expect(helper.director_match).to match_array([@movie_2])
    end
    it 'creates a new instance of @movie_array if none exists' do
      assign(:current_user, @user)
      params[:director] = "Stanley Kubrick"
      matched_movie = @user.movies.find_by(director: "Stanley Kubrick")
      expect(helper.director_match).to be_an(Array)
      expect(helper.director_match).to include(matched_movie)
    end
  end

  describe '#decade_match' do
    it 'returns all movies from 1950s or earlier' do
      dbl = double("Movie", :title => "Wings", :decade => "1920")
      expect(dbl.decade).to eq("1920")
      assign(:movie_array, [dbl])
      params[:decade] = "1950s or earlier"
      expect(helper.decade_match).to match_array([dbl])
    end
    it 'returns all movies from a user-selected decade and creates new instance of @movie_array if none exists' do
      assign(:current_user, @user)
      params[:decade] = "2000s"
      matched_movie = @user.movies.find_by(decade: "2000")
      expect(helper.decade_match).to be_an(Array)
      expect(helper.decade_match).to include(matched_movie)
    end
    it 'returns no movies if user-selected decade matches no movies' do
      assign(:current_user, @user)
      params[:decade] = "2010s"
      expect(helper.decade_match.length).to eq(0)
    end
  end

  describe '#actor_match' do
    it 'returns all movies featuring a chosen actor' do
      dbl = double("Movie", :title => "The Man Who Fell To Earth", :actors => "David Bowie")
      expect(dbl.actors).to eq("David Bowie")
      assign(:movie_array, [dbl, @movie_1, @movie_2, @movie_3])
      params[:actors] = "David Bowie"
      expect(helper.actor_match).to match_array([dbl, @movie_3])
    end
    it 'creates a new instance of @movie_array if none exists' do
      assign(:current_user, @user)
      params[:actors] = "David Bowie"
      matched_movie = @user.movies.find_by(title: "Labyrinth")
      expect(helper.actor_match).to be_an(Array)
      expect(helper.actor_match).to include(matched_movie)
    end
  end

  describe '#genre_match' do
    it 'returns all movies that match a chosen genre' do
      dbl = double("Movie", :title => "Rogue One", :genre => "Sci-Fi, Adventure")
      expect(dbl.genre).to include("Sci-Fi")
      assign(:movie_array, [dbl, @movie_1, @movie_2, @movie_3])
      params[:genre] = "Sci-Fi"
      expect(helper.genre_match).to match_array([dbl, @movie_2])
    end
    it 'creates a new instance of @movie_array if none exists' do
      assign(:current_user, @user)
      params[:genre] = "Fantasy"
      matched_movie = @user.movies.find_by(title: "Labyrinth")
      expect(helper.genre_match).to be_an(Array)
      expect(helper.genre_match).to include(matched_movie)
    end
  end

  describe '#rotten_tomatoes_range' do
    it 'returns all movies with an RT score greater than or equal to the user\'s selection' do
      assign(:movie_array, [@movie_1, @movie_2, @movie_3])
      params[:tomatoes] = "> 90"
      expect(helper.rotten_tomatoes_range).to match_array([@movie_1, @movie_2])
    end
    it 'creates a new instance of @movie_array if none exists' do
      assign(:current_user, @user)
      params[:tomatoes] = "> 50"
      matched_movies = []
      @user.movies.each {|movie| matched_movies << movie}
      expect(helper.rotten_tomatoes_range).to be_an(Array)
      expect(helper.rotten_tomatoes_range).to match_array(matched_movies)
    end
  end

  describe '#make_sorted_genre_array' do
    it 'sorts all of a user\'s movie genres alphabetically' do
      assign(:current_user, @user)
      sorted_array = helper.make_sorted_genre_array
      expect(sorted_array).to start_with("Adventure")
      expect(sorted_array).to end_with("Sci-Fi")
    end
  end

  describe '#make_sorted_actors_array' do
    it 'sorts all of a user\'s movie actors alphabetically' do
      assign(:current_user, @user)
      sorted_array = helper.make_sorted_actors_array
      expect(sorted_array).to start_with("Ben Burtt")
      expect(sorted_array).to end_with("William Sylvester")
    end
  end

  describe '#make_sorted_directors_array' do
    it 'sorts all of a user\'s movie directors alphabetically' do
      assign(:current_user, @user)
      sorted_array = helper.make_sorted_directors_array
      expect(sorted_array).to start_with("Andrew Stanton")
      expect(sorted_array).to end_with("Stanley Kubrick")      
    end
  end

  describe '#check_duplicates' do
    it 'does not add a movie if it already exists in the user\'s watch list' do
      assign(:current_user, @user)
      expect(helper.check_duplicates("Labyrinth")).to be false
      expect(helper.check_duplicates("Finding Dory")).to be_truthy
    end
  end

  context 'getting arrays of duplicate entries' do
    before(:context) do
      @new_user = FactoryBot.create(:user_with_movies)
      @fake_movie = FactoryBot.build(:fake_movie)
      @new_user.movies << @fake_movie
    end
    describe '#get_director_duplicates' do
      it 'gets an array of directors who have more than one movie in a user\'s movie list' do
        assign(:current_user, @new_user)
        expect(helper.get_director_duplicates).to match_array(["Stanley Kubrick"])
      end
    end

    describe '#get_actor_duplicates' do
      it 'gets an array of actors who are in more than one movie in a user\'s movie list' do
        assign(:current_user, @new_user)
        expect(helper.get_actor_duplicates).to match_array(["David Bowie"])
      end
    end

    describe '#get_genre_duplicates' do
      it 'gets an array of genres that describe more than one movie in a user\'s movie list' do
        assign(:current_user, @new_user)
        expect(helper.get_genre_duplicates).to match_array(["Adventure", "Family"])
      end
    end
  end
end
