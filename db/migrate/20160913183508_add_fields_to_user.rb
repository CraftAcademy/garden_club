class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :blurb, :text, length: { maximum: 500 }
    add_column :users, :garden_website, :string
    add_column :users, :g_street, :string
    add_column :users, :g_street2, :string
    add_column :users, :g_postcode, :string
    add_column :users, :g_city, :string
    add_column :users, :g_country, :string
  end
end
