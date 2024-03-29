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
        price: flat.price_per_night,
        photos: flat.photos,
        title: flat.homepagetitle
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
    @flats = Flat.where(user: current_user)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.address = "#{flat_params[:street_address]}, #{flat_params[:city]}, #{flat_params[:country]}"

    if @flat.update(flat_params)
      redirect_to flat_dashboard_path, notice: 'Flat has bee updated'
    else
      render :edit, status: :unprocessable_entity
    end

  end

  private

  def flat_params
    params.require(:flat).permit(:title, :homepagetitle, :street_address, :city, :zipcode, :country, :price_per_night, :description, photos: [])
  end

end
