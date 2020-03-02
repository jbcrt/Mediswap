import places from 'places.js';

const initAddressSearch = () => {
  const addressInputs = document.querySelectorAll('.js-autoCitySearch');
  if (addressInputs.length > 0) {
    addressInputs.forEach(addressInput =>
      places({ 
        container: addressInput,
        language: 'fr',
        countries: 'fr',
        type: 'city',
        useDeviceLocation: false
      })
    );
  }
}
;
const initAddressAutocomplete = () => {
  const streetInput = document.querySelector('.js-streetInput');
  if (document.body.contains(streetInput)) {
    var placesAutocomplete = places({
      container: streetInput,
      templates: {
        value: function(suggestion) {
          return suggestion.name;
        }
      }
    }).configure({
      language: 'fr',
      countries: 'fr',
      type: 'address',
      useDeviceLocation: false
    });
    placesAutocomplete.on('change', function resultSelected(e) {
      $('.js-departmentInput').val(e.suggestion.county || '').trigger('change');
      document.querySelector('.js-cityInput').value = e.suggestion.city || '';
      document.querySelector('.js-zipcodeInput').value = e.suggestion.postcode || '';
    });
  }
};

export { initAddressSearch, initAddressAutocomplete };