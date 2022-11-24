class AddCoordinatesToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :latitude, :float
    add_column :animals, :longitude, :float
  end
end
