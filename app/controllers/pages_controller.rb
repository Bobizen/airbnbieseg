class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @flats = Flat.all

    if params[:query].present?
      @flats = @flats.search_by_title_city_zipcode("#{params[:query]}")
    end

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        price: flat.price_per_night,
        photos: flat.photos.map { |photo| photo.url },
        title: flat.homepagetitle
      }
    end
  end

end
