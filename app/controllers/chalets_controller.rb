class ChaletsController < ApplicationController
  before_action :set_chalet, only: [ :show, :edit, :update, :destroy]
  def index
    # @chalets = Chalet.all

    @chalets = Chalet.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@chalets) do |chalet, marker|
      marker.lat chalet.latitude
      marker.lng chalet.longitude
      # marker.infowindow render_to_string(partial: "/chalets/map_box", locals: { chalet: chalet })
end
  end

  def show
  end

  def new
    @chalet = Chalet.new
    @booking = Booking.new
  end

  def create
    @chalet = Chalet.new(chalet_params)
    if @chalet.save
      redirect_to chalet_path(@chalet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    Chalet.update(chalet_params)
    redirect_to chalet_path(@chalet)
  end

  def destroy
    @chalet.destroy
    redirect_to chalets_path
  end

  private

  def set_chalet
    @chalet = Chalet.find(params[:id])
  end

  def chalet_params
    params.require(:chalet).permit(:name, :capacity, :city, :location, :latitude, :longitude, :altitude, :rating, :price, :cb_accepted, :opening_date, :closing_date, :last_renovation, photos: [])

  end
end
