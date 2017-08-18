class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @booking = Booking.new
    @chalet = Chalet.new
    @selection_mont_blanc = Chalet.where(location: "Massif du Mont-Blanc").limit(3)
    @selection_beaufortain = Chalet.where(location: "Massif du Beaufortain").limit(3)
  end
end
