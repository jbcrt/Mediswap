const dynamicsReplacementsOfferFormFields = () => {
    if (document.body.contains(document.querySelector('.js-replacementsOfferForm'))) {
        const contractTypeRadios = document.querySelectorAll('.js-contractTypeRadio');
        const endsAtField = document.querySelector('.js-endsAtField');
        const endsAtFieldWrapper = document.querySelector('.js-endsAtFieldWrapper');
        const remunerationTypeRadios = document.querySelectorAll('.js-remunerationTypeRadio');
        const salaryField = document.querySelector('.js-salaryField');
        const salaryFieldWrapper = document.querySelector('.js-salaryFieldWrapper');
        const salaryPeriodField = document.querySelector('.js-salaryPeriodField');
        const salaryPeriodFieldWrapper = document.querySelector('.js-salaryPeriodFieldWrapper');
        const retrocessionField = document.querySelector('.js-retrocessionField');
        const retrocessionFieldWrapper = document.querySelector('.js-retrocessionFieldWrapper');
        
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
            endsAtField.value = "";
        };
        
        const displaySalaryField = () => {
            salaryFieldWrapper.classList.remove("d-none");
            salaryFieldWrapper.classList.add("d-block");
            salaryField.required = true;
            salaryField.disabled = false;
        };
        
        const hideSalaryField = () => {
            salaryFieldWrapper.classList.add("d-none");
            salaryFieldWrapper.classList.remove("d-block");
            salaryField.required = false;
            salaryField.disabled = true;
            salaryField.value = "";
        };
        
        const displaySalaryPeriodField = () => {
            salaryPeriodFieldWrapper.classList.remove("d-none");
            salaryPeriodFieldWrapper.classList.add("d-block");
            salaryPeriodField.required = true;
            salaryPeriodField.disabled = false;
        };
        
        const hideSalaryPeriodField = () => {
            salaryPeriodFieldWrapper.classList.add("d-none");
            salaryPeriodFieldWrapper.classList.remove("d-block");
            salaryPeriodField.required = false;
            salaryPeriodField.disabled = true;
            salaryPeriodField.value = "";
        };

        const displayRetrocessionField = () => {
            retrocessionFieldWrapper.classList.remove("d-none");
            retrocessionFieldWrapper.classList.add("d-block");
            retrocessionField.required = true;
            retrocessionField.disabled = false;
        };
        
        const hideRetrocessionField = () => {
            retrocessionFieldWrapper.classList.add("d-none");
            retrocessionFieldWrapper.classList.remove("d-block");
            retrocessionField.required = false;
            retrocessionField.disabled = true;
            retrocessionField.value = "";
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

        // Affichage initial ou après un render "new" des champs liés au type de rémunération
        if (((remunerationTypeRadios[0].checked === false) && (remunerationTypeRadios[1].checked === false))) { // Si aucun type de rémunération n'est selectionné
            hideSalaryField();
            hideSalaryPeriodField();
            hideRetrocessionField();
        } else if (remunerationTypeRadios[0].checked) { // Si "salaire" est selectionné
            displaySalaryField();
            displaySalaryPeriodField();
            hideRetrocessionField();
        } else if (remunerationTypeRadios[1].checked) { // Si "retrocession" est selectionné
            hideSalaryField();
            hideSalaryPeriodField();
            displayRetrocessionField();
        }
        
        let prevRemunerationType = null;
        for (var i = 0; i < remunerationTypeRadios.length; i++) {
            remunerationTypeRadios[i].addEventListener('change', function() {
                if (this !== prevRemunerationType) {
                    prevRemunerationType = this;
                }
                if (this.value === "salary") {
                    displaySalaryField();
                    displaySalaryPeriodField();
                    hideRetrocessionField();
                } else if (this.value === "retrocession") {
                    hideSalaryField();
                    hideSalaryPeriodField();
                    displayRetrocessionField();
                }
            });
        }

    }
}

export { dynamicsReplacementsOfferFormFields };