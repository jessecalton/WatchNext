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
      new_movie = Movie.create(
        title: movie_json.movie_title,
        runtime: movie_json.movie_runtime,
        decade: movie_json.movie_decade,
        genre: movie_json.movie_genre,
        director: movie_json.
        user_id: current_user.id,
        )

      redirect_to user_path(current_user)
    else
      flash[:notice] = 'Please enter a valid movie title'
      redirect_to user_path(current_user)
    end
  end

  def update
  end

  def delete
  end
end
