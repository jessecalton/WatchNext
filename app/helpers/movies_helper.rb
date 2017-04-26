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
      if movie.director.include?(params[:director].titleize)
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

  def genre_match
    current_user.movies.each do |movie|
      if movie.genre.include?(params[:genre].titleize)
        @movie_array << movie 
      end
    end
    @movie_array
  end

  def actor_match
    current_user.movies.each do |movie|
      if movie.actors.include?(params[:actors].titleize)
        @movie_array << movie 
      end
    end
    @movie_array
  end

  def awards_match
    current_user.movies.each do |movie|
      if movie.awards.include?(params[:awards].titleize)
        @movie_array << movie 
      end
    end
    @movie_array
  end

end
