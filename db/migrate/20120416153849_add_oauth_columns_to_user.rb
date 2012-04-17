class AddOauthColumnsToUser < ActiveRecord::Migration
  def change
    add_column :user, :uid, :string
    add_column :users, :name, :string
  end
end
