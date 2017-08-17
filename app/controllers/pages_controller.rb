class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @booking = Booking.new
    @chalet = Chalet.new
  end

end
