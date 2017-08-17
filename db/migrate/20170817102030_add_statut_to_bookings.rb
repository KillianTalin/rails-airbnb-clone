class AddStatutToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :statut, :string
  end
end
