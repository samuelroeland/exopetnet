class AddAddressToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :address, :string
  end
end
