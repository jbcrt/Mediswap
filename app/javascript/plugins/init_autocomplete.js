import places from 'places.js';

const initAutocomplete = () => {
  const addressInputs = document.querySelectorAll('.js-autoCitySearch');
  if (addressInputs.length > 0) {
    addressInputs.forEach(addressInput =>
      places({ 
        container: addressInput,
        language: 'fr',
        countries: 'fr',
        type: 'city',
        templates: {
          value: function(suggestion) {
            return suggestion.name;
          }
        }
      })
    );
  }
};

export { initAutocomplete };