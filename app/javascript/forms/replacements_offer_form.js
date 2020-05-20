const dynamicsReplacementsOfferFormFields = () => {
    if (document.body.contains(document.querySelector('.js-replacementsOfferForm'))) {
        const contractTypeRadios = document.querySelectorAll('.js-contractTypeRadio');
        const endsAtField = document.querySelector('.js-endsAtField');
        const endsAtFieldWrapper = document.querySelector('.js-endsAtFieldWrapper');
        
        const displayEndsAtField = () => {
            endsAtFieldWrapper.classList.remove("d-none");
            endsAtFieldWrapper.classList.add("d-block");
            endsAtField.required = true;
            endsAtField.disabled = false;
        };
        
        const hideEndsAtField = () => {
            endsAtFieldWrapper.classList.add("d-none");
            endsAtFieldWrapper.classList.remove("d-block");
            endsAtField.required = false;
            endsAtField.disabled = true;
        };

        // Affichage initial ou après un render "new" des champs liés au type de remplacement
        if (((contractTypeRadios[0].checked === false) && (contractTypeRadios[1].checked === false)) || contractTypeRadios[1].checked) { // Si aucun type de contrat n'est selectionné ou que "remplacement libéral régulier" est selectionné
            hideEndsAtField();
        } else if (contractTypeRadios[0].checked) { // Si remplacement occasionnel est selectionné
            displayEndsAtField();
        }
        
        let prevContractType = null;
        for (var i = 0; i < contractTypeRadios.length; i++) {
            contractTypeRadios[i].addEventListener('change', function() {
                if (this !== prevContractType) {
                    prevContractType = this;
                }
                if (this.value === "remplacement_liberal_occasionnel") {
                    displayEndsAtField();
                } else if (this.value === "remplacement_liberal_regulier") {
                    hideEndsAtField();
                }
            });
        }

    }
}

export { dynamicsReplacementsOfferFormFields };