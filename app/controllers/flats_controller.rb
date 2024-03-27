class FlatsController < ApplicationController
  def index
    @flats = Flat.all
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

    if @flat.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def flat_params
    params.require(:flat).permit(:title, :address, :city, :country, :price_per_night, :description, photos: [])
  end

end
