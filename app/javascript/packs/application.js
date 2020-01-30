// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bootstrap';
import { profileEditNavbar } from '../components/nav';
import { dynamicsSignUpFormFields } from '../components/sign_up_form';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { offersFiltersSidebar } from '../components/offers_filters_sidebar';

document.addEventListener('turbolinks:load', function() {
    profileEditNavbar();
    dynamicsSignUpFormFields();
    offersFiltersSidebar();
    initAutocomplete();
    initMapbox();
})
