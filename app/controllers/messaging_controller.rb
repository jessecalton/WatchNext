class MessagingController < ApplicationController
  include SessionsHelper
  include MoviesHelper
  def create
    current_user
    messager = Messager.new

    get_all_movie_titles

    username = current_user.username
    movies = @movie_string
    number = "+1" + params[:number]


    if messager.send_message(number, movies, username)
      # Success! Message sent!

      respond_to do |format|
        format.html {redirect_to user_path(current_user)}
        format.js {}
      end

      
    else
      # Boo, something happened.
      Rails.logger.warn("#{messager.error.code}: #{messager.error.message}")
      
      flash[:notice] = "Please enter a valid number in the 5551234567 format"
      redirect_to user_path(current_user)
    end
  
  end
end
