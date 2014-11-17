class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :title
      t.string :address
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
