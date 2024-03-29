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
      style: "mapbox://styles/mapbox/standard"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      let html = `<div class="card">
      <div id="carouselExampleIndicators" class="carousel slide" >
        <div class="carousel-indicators">
        ${marker.photos?.map((image, index) => {
          return `<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${index}" class="${index === 0 ? 'active' : ''}" aria-current="true" aria-label="Slide ${index + 1}"></button>`
        })}
        </div>
        <div class="carousel-inner" >
        ${marker.photos?.map((image, index) => {
          return `<div class="carousel-item ${index === 0 ? 'active' : ''}">
            <img src="${image}"  alt="..." style="min-width: 20rem; min-height:8rem; object-fit:cover;" >
          </div>`
        })}


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
       <h5 class="card-title">${marker.title}</h5>
    </div>`

      var popup = new mapboxgl.Popup({
      })

      var el = document.createElement('div');
      el.insertAdjacentHTML("beforeend",`<span class="font-weight-bold ">$${marker.price}</span>`)
      el.className = 'badge badge-pill badge-light';
      el.style.backgroundColor = 'black';

      var marker = new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
        .setPopup(popup)

      marker.getElement().addEventListener('click', function() {
      popup.setHTML(html)
      .addTo(map);
        });

    })}


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
