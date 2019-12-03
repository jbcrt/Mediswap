import places from 'places.js';

const initAutocomplete = () => {
  const addressInputs = document.querySelectorAll('.js-navbarAddressSearch');
  if (addressInputs.length > 0) {
    addressInputs.forEach(addressInput =>
      places({ 
          container: addressInput,
          language: 'fr',
          country: 'fr',
          type: ['address', 'city'],
      })
    );
  }
};

export { initAutocomplete };