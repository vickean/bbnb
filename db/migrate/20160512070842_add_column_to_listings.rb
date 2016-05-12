class AddColumnToListings < ActiveRecord::Migration
  def change
    add_column :listings, :name, :string
    add_column :listings, :description, :text
    add_column :listings, :country, :string
  end
end
