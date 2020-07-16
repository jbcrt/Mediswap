const dynamicsPatientTransferOfferFormFields = () => {
    if (document.body.contains(document.querySelector('.js-patientTransferOfferForm'))) {

        // ********************************************************
        // Champs dynamiques liés au prix de vente de la patientèle
        // ********************************************************
        const hasSellingPriceSetBool = document.querySelector('.js-hasSellingPriceSetBool');
        const sellingPriceField = document.querySelector('.js-sellingPriceField');
        const sellingPriceWrapper = document.querySelector('.js-sellingPriceWrapper');
        
        const displaySellingPriceField = () => {
            sellingPriceWrapper.classList.remove("d-none");
            sellingPriceWrapper.classList.add("d-block");
            sellingPriceField.required = true;
            sellingPriceField.disabled = false;
        };
        
        const hideSellingPriceField = () => {
            sellingPriceWrapper.classList.add("d-none");
            sellingPriceWrapper.classList.remove("d-block");
            sellingPriceField.required = false;
            sellingPriceField.disabled = true;
        };

        // Affichage initial ou après un render "new" des champs liés au prix de vente de la patientèle
        if (hasSellingPriceSetBool.checked === false) { // Si "has_selling_price_set" est false
            hideSellingPriceField();
        } else if (hasSellingPriceSetBool.checked) { // Si "has_selling_price_set" est true
            displaySellingPriceField();
        }
        
        hasSellingPriceSetBool.addEventListener('change', function() {
            if (this.checked) {
                displaySellingPriceField();
            } else if (this.checked === false) {
                hideSellingPriceField();
            }
        });

        // **************************************************
        // Champs dynamiques liés à la disponibilité du local
        // **************************************************
        const premisesAvailabilityRadios = document.querySelectorAll('.js-premisesAvailabilityRadio');
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
        };

        // Affichage initial ou après un render "new" des champs liés au type de disponibilité du local 
        if ((premisesAvailabilityRadios[0].checked === false) && (premisesAvailabilityRadios[1].checked === false)) { // Si aucun type de disponibilité n'est selectionné
            hidePriceField();
            hideRentField();
        } else if (premisesAvailabilityRadios[0].checked) { // Si la location du local est selectionnée
            hidePriceField();
            displayRentField();
        } else if (premisesAvailabilityRadios[1].checked) { // Si la vente du local est selectionnée
            displayPriceField();
            hideRentField();
        }
        
        let prevPremisesAvailability = null;
        for (var i = 0; i < premisesAvailabilityRadios.length; i++) {
            premisesAvailabilityRadios[i].addEventListener('change', function() {
                if (this !== prevPremisesAvailability) {
                    prevPremisesAvailability = this;
                }
                if (this.value === "sale") {
                    displayPriceField();
                    hideRentField();
                } else if (this.value === "rental") {
                    hidePriceField();
                    displayRentField();
                }
            });
        }

        // *********************************************************
        // Champs dynamiques liés aux équipements de l'établissement
        // *********************************************************
        const premisesFurnishedRadios = document.querySelectorAll('.js-premisesFurnishedRadio');
        const premisesEquipmentField = document.querySelector('.js-premisesEquipmentField');
        const premisesEquipmentFieldWrapper = document.querySelector('.js-premisesEquipmentFieldWrapper');
        
        const displayPremisesEquipmentField = () => {
            premisesEquipmentFieldWrapper.classList.remove("d-none");
            premisesEquipmentFieldWrapper.classList.add("d-block");
            premisesEquipmentField.required = true;
            premisesEquipmentField.disabled = false;
        };
        
        const hidePremisesEquipmentField = () => {
            premisesEquipmentFieldWrapper.classList.add("d-none");
            premisesEquipmentFieldWrapper.classList.remove("d-block");
            premisesEquipmentField.required = false;
            premisesEquipmentField.disabled = true;
        };

        // Affichage initial ou après un render "new" des champs liés aux équipements de l'établissement
        if (premisesFurnishedRadios[0].checked) { // Si "premises_furnished" est true
            displayPremisesEquipmentField();
        } else { // Si "premises_furnished" est false ou qu'aucun radio n'est selectionné
            hidePremisesEquipmentField();
        }

        let prevPremisesFurnished = null;
        for (var i = 0; i < premisesFurnishedRadios.length; i++) {
            premisesFurnishedRadios[i].addEventListener('change', function() {
                if (this !== prevPremisesFurnished) {
                    prevPremisesFurnished = this;
                }
                if (this.value === "true") {
                    displayPremisesEquipmentField();
                } else if (this.value === "false") {
                    hidePremisesEquipmentField();
                }
            });
        }

    }
}

export { dynamicsPatientTransferOfferFormFields };