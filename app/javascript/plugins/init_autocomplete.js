import places from 'places.js';

const initAutocomplete = () => {
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
};

export { initAutocomplete };