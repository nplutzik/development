class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.text :information
      t.text :password_digest

      t.timestamps
    end
  end
end


