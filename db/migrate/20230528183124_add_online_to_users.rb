class AddOnlineToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :online, :boolean
  end
end
