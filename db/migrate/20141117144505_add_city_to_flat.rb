class AddCityToFlat < ActiveRecord::Migration
  def change
     add_column :flats, :city, :string
  end
end
