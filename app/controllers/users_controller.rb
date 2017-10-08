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
    if !logged_in?
      redirect_to root_path
      return
    end

    current_user

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
