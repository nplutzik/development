class CreateService < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :address
      t.text :information

      t.timestamps
    end
  end
end
