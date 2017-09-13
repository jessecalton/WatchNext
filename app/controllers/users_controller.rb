class UsersController < ApplicationController
  include SessionsHelper
  include MoviesHelper

  def index
    @home_page = true
  end

  def new
    @user = User.new
    @errors = @user.errors.full_messages
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    current_user
    get_all_movie_titles
    make_sorted_genre_array

    if params[:runtime].present?
      runtime_match
    end
    if params[:director].present?
      director_match
    end
    if params[:decade].present?
      decade_match
    end
    if params[:genre].present?
      genre_match
    end
    if params[:actors].present?
      actor_match
    end
    if params[:awards].present?
      awards_match
    end
    if params[:tomatoes].present?
      rotten_tomatoes_range
    end

    if params[:number].present?
      new_messager = Messager.new
      username = current_user.username
      movies = @movie_string

      new_messager.send_message(params[:number], movies, username)
      redirect_to user_path(current_user)
    end

    p @movie_string

    respond_to do |format|
      format.html {@movie_array}
      format.js {}
      format.json {render @movie_array, params}
    end

  end

private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
  
end
