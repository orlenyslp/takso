import Vue from "vue";
import axios from "axios";
import 'phoenix_html'

new Vue({
  el: '#takso-app',
  data: {
    pickup_address: "Liivi 2",
    dropoff_address: "",
    map: null,
    geocoder: null
  },
  methods: {
    submitBookingRequest: function() {
        axios.post("/api/bookings", {pickup_address: this.pickup_address, 
            dropoff_address: this.dropoff_address})
          .then(response => {
            this.geocoder.geocode({address: response.data.taxi_location}, (results, status) => {
              if (status === "OK" && results[0]) {
                var taxi_location = results[0].geometry.location;
                new google.maps.Marker({position: taxi_location, map: this.map, title: "Taxi"});
              }
            });
          })
          .catch(error => console.log(error));
    }
  },
  mounted: function () {
    navigator.geolocation.getCurrentPosition(position => {
        let loc = {lat: position.coords.latitude, lng: position.coords.longitude};
        this.geocoder = new google.maps.Geocoder;
        this.geocoder.geocode({location: loc}, (results, status) => {
            if (status === "OK" && results[0])
              this.pickup_address = results[0].formatted_address;
          });
        this.map = new google.maps.Map(document.getElementById('map'), {zoom: 14, center: loc});
        new google.maps.Marker({position: loc, map: this.map, title: "Pickup address"});
      });
  }
});