import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.#setupGeolocation();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    if (!this.markersValue || this.markersValue.length === 0) {
      // Handle case when markers data is empty or undefined
      return;
    }

    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => {
      if (marker.lng && marker.lat) {
        bounds.extend([marker.lng, marker.lat]);
      }
    });

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #setupGeolocation() {
    const centerOnUserLocation = () => {
      navigator.geolocation.getCurrentPosition(position => {
        const lng = position.coords.longitude;
        const lat = position.coords.latitude;
        this.map.flyTo({
          center: [lng, lat],
          zoom: 14 // You can adjust the zoom level here
        });
      });
    };

    // Create button element
    const button = document.createElement('button');
    button.className = 'mapboxgl-ctrl-icon fas fa-map-marker-alt';
    button.title = 'Center Map on Your Location';
    // Add click event listener to button
    button.addEventListener('click', centerOnUserLocation);

    // Add button to the map container
    const mapContainer = this.map.getContainer();
    mapContainer.appendChild(button);
  }
}
