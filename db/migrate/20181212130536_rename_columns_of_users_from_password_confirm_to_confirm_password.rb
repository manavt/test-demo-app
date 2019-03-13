class RenameColumnsOfUsersFromPasswordConfirmToConfirmPassword < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :password_confirm, :confirm_password
  end
end
