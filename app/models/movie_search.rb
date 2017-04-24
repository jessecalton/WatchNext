class MovieSearch
  include HTTParty
  base_uri 'http://www.omdbapi.com/?t='

  def initialize(title)
    movie_url = title.gsub(/\s+/, "+")
    uri = URI.parse("http://www.omdbapi.com/?t=#{movie_url}")
    uri.open {|f| @movie_data = self.class.get(uri) }
    
  end

  def movie_decade
    year = @movie_data["Year"]
    year[-1] = "0"
    return year.to_i
  end

  def movie_runtime
    @movie_data["Runtime"].to_i
  end

  def response
    @movie_data["Response"]
  end

  def movie_title
    @movie_data["Title"]
  end

  def movie_genre
    @movie_data["Genre"]
  end

  def movie_director
    @movie_data["Director"]
  end

  def movie_actors
    @movie_data["Actors"]
  end

  def movie_awards
    @movie_data["Awards"]
  end

  def movie_poster
    @movie_data["Poster"]
  end

  def rotten_tomatoes_score
    @movie_data["Ratings"].second["Value"].to_i
  end
end
