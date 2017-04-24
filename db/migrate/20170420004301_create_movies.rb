class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :runtime
      t.string :decade
      t.string :genre
      t.string :director
      t.string :actors
      t.string :awards
      t.string :poster_url
      t.integer :rotten_tomatoes

      t.integer :user_id
      
      t.timestamps
    end
  end
end
