class MoviesController < ApplicationController
  include SessionsHelper
  include ApplicationHelper

  def index
  end

  def new
  end

  def create
    current_user
    movie = params[:search][:title]
    movie_json = MovieSearch.new(movie) 
    if movie_json.response != "False" && check_duplicates(movie_json.movie_title)
      @new_movie = Movie.create(
        title: movie_json.movie_title,
        runtime: movie_json.movie_runtime,
        decade: movie_json.movie_decade,
        genre: movie_json.movie_genre,
        director: movie_json.movie_director,
        actors: movie_json.movie_actors,
        awards: movie_json.movie_awards,
        poster_url: movie_json.movie_poster,
        rotten_tomatoes: movie_json.rotten_tomatoes_score,
        user_id: current_user.id
        )

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js
    end
      
    else
      flash[:notice] = 'Please enter a valid movie title'
      redirect_to user_path(current_user)
    end
  end

  def update
  end

  def destroy
    @movie = current_user.movies.find(params[:id])
    respond_to do |format|
      format.html {
        @movie.destroy
        redirect_to user_path(current_user)
      }
      format.js {@movie.destroy}
    end
  end
end
