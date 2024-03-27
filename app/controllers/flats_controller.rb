class FlatsController < ApplicationController
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    if @flat.save
      redirect_to root_path
    else

    end

  end

  def flat_params
    params.require(:flat).permit(:title, :address, :city, :country, :price_per_night, :description, photos: [])
  end
end
