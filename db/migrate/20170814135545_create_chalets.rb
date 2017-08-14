class CreateChalets < ActiveRecord::Migration[5.0]
  def change
    create_table :chalets do |t|
      t.string :name
      t.integer :capacity
      t.string :city
      t.string :location
      t.float :latitude
      t.float :longitude
      t.integer :altitude
      t.integer :rating
      t.integer :price
      t.boolean :cb_accepted
      t.date :opening_date
      t.date :closing_date
      t.date :last_renovation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
