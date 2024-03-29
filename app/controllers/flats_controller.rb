class FlatsController < ApplicationController
  def index
    @flats = Flat.all

    if params[:query].present?
      @flats = @flats.search_by_title_city_zipcode("#{params[:query]}")
    end

    # The `geocoded` scope filters only flats with coordinates
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        price: flat.price_per_night
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    @flat.address = "#{flat_params[:street_address]}, #{flat_params[:city]}, #{flat_params[:country]}"

    if @flat.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def dashboard

  end

  private

  def flat_params
    params.require(:flat).permit(:title, :street_address, :city, :country, :price_per_night, :description, photos: [])
  end

end
