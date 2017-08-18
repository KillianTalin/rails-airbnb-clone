class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings_guest = Booking.where(user: current_user).order(:start_date)

    @bookings_guest_now = @bookings_guest.select { |b| b.now? }
    @bookings_guest_past = @bookings_guest.select { |b| b.passed? }
    @bookings_guest_futur = @bookings_guest.select { |b| b.futur? }

    @chalet = Chalet.where(user: current_user)

    @bookings_host = Booking.where(chalet_id: @chalet).order(:start_date)

    @bookings_host_now = @bookings_host.select { |b| b.now? }
    @bookings_host_past = @bookings_host.select { |b| b.passed? }
    @bookings_host_futur = @bookings_host.select { |b| b.futur? }
  end

  def show
    @chalet = Chalet.find(params[:chalet_id])

    @cha = Chalet.where(user: current_user)
    @bookings_host = Booking.where(chalet_id: @cha).order(:start_date)
    @bookings_host_now = @bookings_host.select { |b| b.now? }

    @place = Booking.where(id: @bookings_host_now, chalet_id: @chalet, statut: "Validé").sum(:guest_number)
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

  def set_accepte
    @booking = Booking.find(params[:booking_id])

    # if @booking.statut == "Pending"
      @booking.statut = "Validé"
      @booking.save
    redirect_to bookings_path
  end

  def set_refuse
    @booking = Booking.find(params[:booking_id])

    # if @booking.statut == "Pending"
      @booking.statut = "Refusé"
      @booking.save
      redirect_to bookings_path
  end

  def set_annule
        @booking = Booking.find(params[:booking_id])

    # if @booking.statut == "Validé"
      @booking.statut = "Annulé"
      @booking.save
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
