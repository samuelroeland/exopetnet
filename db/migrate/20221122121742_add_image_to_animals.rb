class AddImageToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :image, :string
  end
end
