const dynamicsRoomOfferFormFields = () => {
    if (document.body.contains(document.querySelector('.js-roomOfferForm'))) {
        const contractTypeRadios = document.querySelectorAll('.js-contractTypeRadio');
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

        // Affichage initial ou après un render "new" des champs liés au type de contrat
        if ((contractTypeRadios[0].checked === false) && (contractTypeRadios[1].checked === false)) { // Si aucun type de contrat n'est selectionné
            hidePriceField();
            hideRentField();
        } else if (contractTypeRadios[0].checked) { // Si cession de local est selectionnée
            displayPriceField();
            hideRentField();
        } else if (contractTypeRadios[1].checked) { // Si location de local est selectionnée
            hidePriceField();
            displayRentField();
        }
        
        let prevContractType = null;
        for (var i = 0; i < contractTypeRadios.length; i++) {
            contractTypeRadios[i].addEventListener('change', function() {
                if (this !== prevContractType) {
                    prevContractType = this;
                }
                if (this.value === "cession_local") {
                    displayPriceField();
                    hideRentField();
                } else if (this.value === "location_local") {
                    hidePriceField();
                    displayRentField();
                }
            });
        }

    }
}

export { dynamicsRoomOfferFormFields };