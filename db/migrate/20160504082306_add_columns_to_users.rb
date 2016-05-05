class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :birthday, :date
    add_column :users, :phonenumber, :string
    add_column :users, :description, :text
    add_column :users, :country, :string
  end
end
