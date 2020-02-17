import places from 'places.js';

const initAddressSearch = () => {
  const addressInputs = document.querySelectorAll('.js-autoCitySearch');
  if (addressInputs.length > 0) {
    addressInputs.forEach(addressInput =>
      places({ 
        container: addressInput,
        language: 'fr',
        countries: 'fr',
        type: 'city'
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
      type: 'address'
    });
    placesAutocomplete.on('change', function resultSelected(e) {
      document.querySelector('.js-departmentInput').value = e.suggestion.county || '';
      document.querySelector('.js-cityInput').value = e.suggestion.city || '';
      document.querySelector('.js-zipcodeInput').value = e.suggestion.postcode || '';
    });
  }
};

export { initAddressSearch, initAddressAutocomplete };