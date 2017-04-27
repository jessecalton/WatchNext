module MoviesHelper

  def initialize_movie_array
    @movie_array ||= []
  end

  def runtime_match
    if @movie_array
      @movie_array.delete_if {|movie| movie.runtime > params[:runtime].to_i}
    else
      @movie_array = []
      current_user.movies.each do |movie|
        if movie.runtime <= params[:runtime].to_i
          @movie_array << movie
        end
      end
    end
    @movie_array
  end

  def director_match
    if @movie_array
      @movie_array.delete_if {|movie| movie.director.exclude?(params[:director].titleize)}
    else
      @movie_array = []
      current_user.movies.each do |movie|
        if movie.director.include?(params[:director].titleize)
          @movie_array << movie
        end
      end
    end
    @movie_array
  end

  def decade_match
    if @movie_array 
      @movie_array.delete_if {|movie| movie.decade.exclude?(params[:decade])}
    else
      @movie_array = []
      current_user.movies.each do |movie|
        if movie.decade == params[:decade]
          @movie_array << movie
        end
      end
    end
    @movie_array
  end

  def genre_match
    if @movie_array 
      @movie_array.delete_if {|movie| movie.genre.exclude?(params[:genre].titleize)}
    else
      @movie_array = []
      current_user.movies.each do |movie|
        if movie.genre.include?(params[:genre].titleize)
          @movie_array << movie 
        end
      end
    end
    @movie_array
  end

  def actor_match
    if @movie_array 
      @movie_array.delete_if {|movie| movie.actors.exclude?(params[:actors].titleize)}
    else
      @movie_array = []
      current_user.movies.each do |movie|
        if movie.actors.include?(params[:actors].titleize)
          @movie_array << movie 
        end
      end
    end
    @movie_array
  end

  def awards_match
    if @movie_array 
      @movie_array.delete_if {|movie| movie.awards.exclude?(params[:awards].titleize)}
    else
      @movie_array = []
      current_user.movies.each do |movie|
        if movie.awards.include?(params[:awards].titleize)
          @movie_array << movie 
        end
      end
    end
    @movie_array
  end

end
