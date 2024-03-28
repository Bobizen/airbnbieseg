import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue



    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      console.log(this)

      var popup = new mapboxgl.Popup({
        closeOnClick: false

    })
      .setHTML(
      `<div class="card">
        <div id="carouselExampleIndicators" class="carousel slide" >
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner" >
            <div class="carousel-item active">
              <img src="https://kitt.lewagon.com/placeholder/users/ssaunier"  alt="..." style="min-width: 20rem; min-height:8rem; object-fit:cover;" >
            </div>
            <div class="carousel-item">
              <img src="https://kitt.lewagon.com/placeholder/users/ssaunier"  alt="..." style="min-width: 20rem; min-height:8rem; object-fit:cover;">
            </div>
            <div class="carousel-item">
              <img src="https://kitt.lewagon.com/placeholder/users/ssaunier"  alt="..." style="min-width: 20rem; min-height:8rem; object-fit:cover;">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
      </div>
         <h5 class="card-title">Card title</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
      </div>`)
      .addTo(this.map);

      var el = document.createElement('div');
      el.insertAdjacentHTML("beforeend",`<span class="font-weight-bold p-1">$${marker.price}</span>`)
      el.className = 'badge badge-pill badge-light';
      el.style.backgroundColor = 'black';

      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
        .setPopup(popup);
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
