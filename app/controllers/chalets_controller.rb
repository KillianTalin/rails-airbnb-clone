class ChaletsController < ApplicationController
  before_action :set_chalet, only: [ :show, :edit, :update, :destroy]
  def index
    # @chalets = Chalet.all
    @chalets = Chalet.where.not(latitude: nil, longitude: nil)
    if params[:location].present?
      @chalets = @chalets.near(params[:location], 50)
    end
    #@chalets = Chalet.where params[:location]
    # @results = @chalets.where(location: params[:location])
    @hash = Gmaps4rails.build_markers(@chalets) do |chalet, marker|
      marker.lat chalet.latitude
      marker.lng chalet.longitude
      # marker.infowindow render_to_string(partial: "/chalets/map_box", locals: { chalet: chalet })
    end
  end


  def show
    @booking = Booking.new
    @reserved_count = Booking.where(chalet_id: @chalet).where("created_at < ?", 30.days.ago).count
  end



  def new
    @chalet = Chalet.new
    @booking = Booking.new
  end

  def create
    @chalet = Chalet.new(chalet_params)
    @chalet.user = current_user
    if @chalet.save
      redirect_to chalet_path(@chalet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @chalet.update(chalet_params)
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
