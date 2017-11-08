import Vue from "vue";
import axios from "axios";
import "./socket";
import 'phoenix_html'

import customer from "./customer";
import driver from "./driver";

Vue.component("customer", customer);
Vue.component("driver", driver);

new Vue({}).$mount("#takso-app");