module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
  end

  def check_duplicates(str)
    current_user.movies.each do |movie|
      if movie.title == str
        return false
      end
    end
  end

end
