class AddColumn < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :email, :string
  end
end
