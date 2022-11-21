class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :username
      t.string :user_type

      t.timestamps
    end
  end
end
