class ChangeColumnNameInServicesUsers < ActiveRecord::Migration
  def change
    rename_column :services_users, :users_id, :user_id
    rename_column :services_users, :services_id , :service_id
  end
end
