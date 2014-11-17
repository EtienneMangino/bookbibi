class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.date :day
      t.references :flat, index: true
      t.references :booking, index: true

      t.timestamps
    end
  end
end
