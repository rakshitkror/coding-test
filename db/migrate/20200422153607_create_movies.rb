class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.integer :rows
      t.integer :column
      t.text :summary
      t.string :genre
      t.integer :year
      t.string :imdb

      t.timestamps
    end
  end
end
