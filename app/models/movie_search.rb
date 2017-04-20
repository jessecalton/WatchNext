class MovieSearch
  include HTTParty
  base_uri 'http://www.omdbapi.com/?t='

  def initialize(title)
    movie_url = title.gsub(/\s+/, "+")
    uri = URI.parse("http://www.omdbapi.com/?t=#{movie_url}")
    uri.open {|f| @movie_data = self.class.get(uri) }
    
  end

  def movie_year
    @movie_data["Year"] ## This works!!!
    
  end

  def movie_time
    @movie_data["Runtime"]
  end

  def response
    @movie_data["Response"]
  end

  def movie_title
    @movie_data["Title"]
  end
end
