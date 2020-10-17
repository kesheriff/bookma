class CreateMovieFromTmdbs < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_from_tmdbs do |t|
      t.string :title
      t.integer :rating
      t.text :description
      t.datetime :release_date

      t.timestamps
    end
  end
end
