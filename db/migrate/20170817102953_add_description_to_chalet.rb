class AddDescriptionToChalet < ActiveRecord::Migration[5.0]
  def change
    add_column :chalets, :description, :string
  end
end
