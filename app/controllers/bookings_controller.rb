class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings_guest = Booking.where(user: current_user).order(:start_date)
    @chalet = Chalet.where(user: current_user)
    @bookings_host = Booking.where(chalet_id: @chalet).order(:start_date)
  end

  def show
    @chalet = Chalet.find(params[:chalet_id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @chalet = Chalet.find(params[:chalet_id])
    @booking = Booking.new(booking_params)
    @booking.chalet = @chalet
    @booking.user = current_user
    @booking.statut = "Pending"
    self.price
    if @booking.save
      redirect_to bookings_path
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

    def destroy
      @booking.destroy
      redirect_to bookings_path
    end

  private

  def set_chalet
    @chalet = Chalet.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
  params.require(:booking).permit(:start_date, :end_date, :guest_number)
  end
end
