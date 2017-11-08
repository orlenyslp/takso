<template>
<div class="well">
  {{message}}
  <div id="map-driver" style="width:100%;height:300px"></div>
</div>
</template>

<script>
import socket from "./socket";

export default {
    data: function() {
        return {
            message: "Hello there"
        }
    },
    mounted: function() {
        var channel = socket.channel("driver:lobby", {});
        channel.join()
            .receive("ok", resp => { console.log("Joined successfully", resp) })
            .receive("error", resp => { console.log("Unable to join", resp) });

        channel.on("requests", payload => {
            this.message = payload;
        });
    }
}
</script>