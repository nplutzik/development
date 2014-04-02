class CreateServicesUsers < ActiveRecord::Migration
  def change
    create_table :services_users do |t|
      t.belongs_to :users
      t.belongs_to :services
    end
  end
end
