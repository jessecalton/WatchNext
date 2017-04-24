module MoviesHelper

  def initialize_movie_array
    @movie_array ||= []
  end

  def get_user_movies
  end

  def runtime_match
    current_user.movies.each do |movie|
      if movie.runtime <= params[:runtime].to_i
        @movie_array << movie
      end
    end
    @movie_array
  end

  def director_match
    current_user.movies.each do |movie|
      if movie.director.include?(params[:director].capitalize)
        @movie_array << movie
      end
    end
    @movie_array
  end

  def decade_match
  current_user.movies.each do |movie|
    if movie.decade == params[:decade]
      @movie_array << movie
    end
  end
  @movie_array
end


  # def movie_title_match(str) # params[:runtime].to_i
  #   current_user.movies.each do |movie|
  #     if 
  # end
end
