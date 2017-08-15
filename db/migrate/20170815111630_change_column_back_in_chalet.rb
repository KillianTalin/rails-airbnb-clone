class ChangeColumnBackInChalet < ActiveRecord::Migration[5.0]
  def change
    remove_column :chalets, :opening_date
    remove_column :chalets, :closing_date
  end
end
