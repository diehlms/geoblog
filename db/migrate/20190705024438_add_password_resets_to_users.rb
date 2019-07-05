class AddPasswordResetsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirm_token, :string
    add_column :users, :email_confirmed, :boolean, default: false
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datetime
  end
end
