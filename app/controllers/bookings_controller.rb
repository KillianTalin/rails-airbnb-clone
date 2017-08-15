class BookingsController < ApplicationController
  before_action :set_booking only: [:show, :create, :edit, :update, :destroy]

  def index
    @bookings_guest = Booking.where(user: current_user)
    @bookings_host = Chalet.where(user: current_user).bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.chalet = @chalet
    @booking.user = current_user
    if @booking.save
      redirect_to chalet_booking_path(@booking)
    else
      render :new
    end
  end

    def edit

    end

    def update
      @booking.update(booking_params)
      if @booking.save
        redirect_to chalet_booking_path(@booking)
      else
        render :new
      end
    end

  private

  def set_chalet
    @chalet = Chalet.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
  params.require(:booking).permit(:start_date, :end_start, :guest_number)
  end
end

#efd

