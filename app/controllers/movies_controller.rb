class MoviesController < ApplicationController
  include SessionsHelper
  include ApplicationHelper
  include MoviesHelper

  def index
  end

  def new
  end

  def create
    current_user
    if params[:search].present?
      movie_title = params[:search][:title]
      movie_year = ""
      imdb_id = ""
    end
    if params[:adv_search].present?
      movie_title = params[:adv_search][:title]
      movie_year = params[:adv_search][:year]
      imdb_id = params[:adv_search][:imdbid]
    end
    movie_json = MovieSearch.new(movie_title, movie_year, imdb_id) 
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

  def show
    @movie = current_user.movies.find(params[:id])
    respond_to do |format|
      format.html
      format.js {@movie}
    end
  end

  def update
  end

  def destroy
    p "********************"
    delete_from_duplicates("directors")
    p @new_arr
    p "*******************"
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
