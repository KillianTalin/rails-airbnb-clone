class ChangeColumnInChalet < ActiveRecord::Migration[5.0]
  def change
    change_column :chalets, :opening_date, :string
    change_column :chalets, :closing_date, :string
    change_column :chalets, :last_renovation, :string
  end
end
