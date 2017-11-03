require 'open-uri'

class MovieSearch
  include HTTParty
  # base_uri 'http://www.omdbapi.com/?t='

  def initialize(title, year, imdb_id)
    if title && year == "" && imdb_id == ""
      movie_url = "t=" + title.gsub(/\s+/, "+")
    elsif title && year && imdb_id == ""
      movie_url = "t=" + title.gsub(/\s+/, "+") + "&y=" + year
      p movie_url
    elsif imdb_id
      movie_url = "i=" + imdb_id
    end
    api_key = ENV["API_KEY"]

    @movie_data = JSON.load(open("http://www.omdbapi.com/?#{movie_url}&apikey=#{api_key}"))
    
    # uri = URI.parse("http://www.omdbapi.com/?#{movie_url}&apikey=#{api_key}")
    # uri.open {|f| @movie_data = self.class.get(uri) }
    
  end

  def movie_decade
    year = @movie_data["Year"]
    year[-1] = "0"
    return year.to_i
  end

  def movie_data
    @movie_data
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
    @movie_data["Ratings"].find { |x| x["Source"] == "Rotten Tomatoes" }["Value"].to_i
  end
end
