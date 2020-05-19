import { autoResizeTextarea } from '../components/auto_resize_textarea';

const dynamicsEstablishmentOfferFormFields = () => {
    if (document.body.contains(document.querySelector('.js-establishmentOfferForm'))) {

        // ************************************************************
        // Champs dynamiques liés à la disponibilité de l'établissement
        // ************************************************************
        const establishmentContractTypeRadios = document.querySelectorAll('.js-establishmentContractTypeRadio');
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
        if ((establishmentContractTypeRadios[0].checked === false) && (establishmentContractTypeRadios[1].checked === false)) { // Si aucun type de disponibilité n'est selectionné
            hidePriceField();
            hideRentField();
        } else if (establishmentContractTypeRadios[0].checked) { // Si cession de local est selectionnée
            displayPriceField();
            hideRentField();
        } else if (establishmentContractTypeRadios[1].checked) { // Si location de local est selectionnée
            hidePriceField();
            displayRentField();
        }
        
        let prevContractType = null;
        for (var i = 0; i < establishmentContractTypeRadios.length; i++) {
            establishmentContractTypeRadios[i].addEventListener('change', function() {
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

        // *********************************************************
        // Champs dynamiques liés aux équipements de l'établissement
        // *********************************************************
        const premisesFurnishedRadios = document.querySelectorAll('.js-premisesFurnishedRadio');
        const premisesEquipmentField = document.querySelector('.js-premisesEquipmentField');
        const premisesEquipmentFieldWrapper = document.querySelector('.js-premisesEquipmentFieldWrapper');
        
        const displayPremisesEquipmentField = () => {
            premisesEquipmentFieldWrapper.classList.remove("d-none");
            premisesEquipmentFieldWrapper.classList.add("d-block");
            premisesEquipmentField.classList.add("js-autoResizeTextarea");
            premisesEquipmentField.required = true;
            premisesEquipmentField.disabled = false;
            autoResizeTextarea();
        };
        
        const hidePremisesEquipmentField = () => {
            premisesEquipmentFieldWrapper.classList.add("d-none");
            premisesEquipmentFieldWrapper.classList.remove("d-block");
            premisesEquipmentField.classList.remove("js-autoResizeTextarea");
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

export { dynamicsEstablishmentOfferFormFields };