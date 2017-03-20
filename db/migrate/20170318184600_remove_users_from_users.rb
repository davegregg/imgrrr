class RemoveUsersFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :Users, :string
  end
end
