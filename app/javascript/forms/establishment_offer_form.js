const dynamicsEstablishmentOfferFormFields = () => {
    if (document.body.contains(document.querySelector('.js-establishmentOfferForm'))) {
        const roomAvailabilityTypeRadios = document.querySelectorAll('.js-roomAvailabilityRadio');
        const priceField = document.querySelector('.js-priceField');
        const priceFieldWrapper = document.querySelector('.js-priceFieldWrapper');
        const rentField = document.querySelector('.js-rentField');
        const rentFieldWrapper = document.querySelector('.js-rentFieldWrapper');
        
        const displayPriceField = () => {
            priceFieldWrapper.classList.remove("d-none");
            priceFieldWrapper.classList.add("d-block");
            priceField.required = true;
            priceField.disabled = false;
        };
        
        const hidePriceField = () => {
            priceFieldWrapper.classList.add("d-none");
            priceFieldWrapper.classList.remove("d-block");
            priceField.required = false;
            priceField.disabled = true;
            priceField.value = "";
        };

        const displayRentField = () => {
            rentFieldWrapper.classList.remove("d-none");
            rentFieldWrapper.classList.add("d-block");
            rentField.required = true;
            rentField.disabled = false;
        };
        
        const hideRentField = () => {
            rentFieldWrapper.classList.add("d-none");
            rentFieldWrapper.classList.remove("d-block");
            rentField.required = false;
            rentField.disabled = true;
            rentField.value = "";
        };

        // Affichage initial ou après un render "new" des champs liés au type de disponibilité du local 
        if ((roomAvailabilityTypeRadios[0].checked === false) && (roomAvailabilityTypeRadios[1].checked === false)) { // Si aucun type de disponibilité n'est selectionné
            hidePriceField();
            hideRentField();
        } else if (roomAvailabilityTypeRadios[0].checked) { // Si cession de local est selectionnée
            displayPriceField();
            hideRentField();
        } else if (roomAvailabilityTypeRadios[1].checked) { // Si location de local est selectionnée
            hidePriceField();
            displayRentField();
        }
        
        let prevRoomAvailability = null;
        for (var i = 0; i < roomAvailabilityTypeRadios.length; i++) {
            roomAvailabilityTypeRadios[i].addEventListener('change', function() {
                if (this !== prevRoomAvailability) {
                    prevRoomAvailability = this;
                }
                if (this.value === "room_cession") {
                    displayPriceField();
                    hideRentField();
                } else if (this.value === "room_location") {
                    hidePriceField();
                    displayRentField();
                }
            });
        }

    }
}

export { dynamicsEstablishmentOfferFormFields };