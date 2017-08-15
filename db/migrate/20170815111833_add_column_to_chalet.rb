class AddColumnToChalet < ActiveRecord::Migration[5.0]
  def change
    add_column :chalets, :opening_date, :date
    add_column :chalets, :closing_date, :date
  end
end
