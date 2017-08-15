class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.date :start_date
      t.date :end_start
      t.integer :guest_number
      t.integer :checkout
      t.references :chalet, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
