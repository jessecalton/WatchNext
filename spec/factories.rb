FactoryBot.define do

  factory :movie_1, class: Movie do
    title "WALL-E"
    runtime 98
    decade "2000"
    genre "Animation, Adventure, Family"
    director "Andrew Stanton"
    actors "Ben Burtt, Elissa Knight, Jeff Garlin, Fred Willard" 
    awards "Won 1 Oscar. Another 89 wins & 90 nominations."
    poster_url "https://images-na.ssl-images-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_SX300.jpg"
    rotten_tomatoes 96
    user
  end

  factory :movie_2, class: Movie do
    title "2001: A Space Odyssey"
    runtime 149
    decade "1960"
    genre "Adventure, Sci-Fi"
    director "Stanley Kubrick"
    actors "Keir Dullea, Gary Lockwood, William Sylvester, Daniel Richter"
    awards "Won 1 Oscar. Another 13 wins & 10 nominations."
    poster_url "https://images-na.ssl-images-amazon.com/images/M/MV5BMTZkZTBhYmUtMTIzNy00YTViLTg1OWItNGUwMmVlN2FjZTVkXkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_SX300.jpg"
    rotten_tomatoes 94
    user
  end
  factory :movie_3, class: Movie do
    title "Labyrinth"
    runtime 101
    decade "1980"
    genre "Adventure, Family, Fantasy"
    director "Jim Henson"
    actors "David Bowie, Jennifer Connelly, Toby Froud, Shelley Thompson"
    awards "Nominated for 1 BAFTA Film Award. Another 3 nominations."
    poster_url "https://images-na.ssl-images-amazon.com/images/M/MV5BMjM2MDE4OTQwOV5BMl5BanBnXkFtZTgwNjgxMTg2NzE@._V1_SX300.jpg"
    rotten_tomatoes 68
    user
  end

  factory :user do
    email "tom@tomtom.com"
    username "tomtom"
    password "tomtom"


    factory :user_with_movies do

      after(:create) do |user|
        create(:movie_1, user: user)
        create(:movie_2, user: user)
        create(:movie_3, user: user)
      end
    end
  end
end