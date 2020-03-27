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
import { dynamicsReplacementsOfferFormFields } from '../forms/replacements_offer_form';
import { dynamicsEmploymentOfferFormFields } from '../forms/employment_offer_form';
import { dynamicsRoomOfferFormFields } from '../forms/room_offer_form';
import { cleanOffersFiltersForm } from '../components/offers_filters_form';
import { autoResizeTextarea } from '../components/auto_resize_textarea';
import { autoCalculateRetrocession } from '../components/auto_calculate_retrocession';
import { initMapbox } from '../plugins/init_mapbox';
import { initAddressSearch, initAddressAutocomplete } from '../plugins/init_algolia_places';
import { initSelect2Searchable, initSelect2 } from '../plugins/init_select2';

document.addEventListener('turbolinks:load', function() {
    profileEditNavbar();
    dynamicsSignUpFormFields();
    dynamicsReplacementsOfferFormFields();
    dynamicsEmploymentOfferFormFields();
    dynamicsRoomOfferFormFields();
    cleanOffersFiltersForm();
    initAddressSearch();
    initAddressAutocomplete();
    initSelect2();
    initSelect2Searchable();
    autoResizeTextarea();
    autoCalculateRetrocession();
    initMapbox();
})