class Movie < ApplicationRecord
  belongs_to :user



  # scope :genre, -> (genre) { where("LOWER(genre) LIKE 'LOWER(?)'", genre) }

  # scope :director, -> (director) { where('LOWER(director) = LOWER(?)', director) }
end
