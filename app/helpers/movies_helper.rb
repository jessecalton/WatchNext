module MoviesHelper

# Using this method for SMS message of watch list
  def get_all_movie_titles
    @movie_title_array = []
    current_user.movies.each do |movie|
      @movie_title_array << movie.title
    end
    @movie_title_array
  end


# These methods for searching through watch list
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
    old_decades = ["1950", "1940", "1930", "1920", "1910"]
    if @movie_array
      if params[:decade] == "1950s or earlier"
        @movie_array.delete_if {|movie| !old_decades.include?(movie.decade)}
      else
        @movie_array.delete_if {|movie| movie.decade.exclude?(params[:decade].chop)}
      end
    end
    if !@movie_array
      @movie_array = []
      current_user.movies.each do |movie|
        if params[:decade] == "1950s or earlier" && old_decades.include?(movie.decade)
          @movie_array << movie
        elsif movie.decade == params[:decade].chop
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

  def rotten_tomatoes_range
    sanitize_integer_params
    if @movie_array 
      @movie_array.delete_if {|movie| movie.rotten_tomatoes < params[:tomatoes]}
    else
      @movie_array = []
      current_user.movies.each do |movie|
        if movie.rotten_tomatoes > params[:tomatoes]
          @movie_array << movie 
        end
      end
    end
    @movie_array
  end

  def make_sorted_genre_array
    @genre_array = []
      current_user.movies.each do |movie|
        movie.genre.scan(/[A-Z][a-z]+/).each do |genre|
          @genre_array << genre 
        end
      end
    @genre_array.sort!
  end

  def make_sorted_actors_array
    @actors_array = []
      current_user.movies.each do |movie|
        movie.actors.split(',').each do |actor|
          @actors_array << actor.strip
        end
      end
    @actors_array.sort!
  end

  private

  def sanitize_integer_params
    params[:tomatoes] = params[:tomatoes].delete!("> ").to_i
  end

end
