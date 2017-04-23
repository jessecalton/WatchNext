class MoviesController < ApplicationController
  include SessionsHelper

  def index
  end

  def new
  end

  def create
    current_user
    movie = params[:search][:title]
    movie_json = MovieSearch.new(movie)
    
    if movie_json.response != "False" && current_user.movies != movie_json.movie_title
      new_movie = Movie.create(title: movie_json.movie_title, user_id: current_user.id)

      redirect_to user_path(current_user)
    else
      @errors = ["Please enter a valid movie title"]
      render 'users#show'
    end
  end

  def update
  end

  def delete
  end
end
