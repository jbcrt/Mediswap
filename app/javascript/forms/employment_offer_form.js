const dynamicsEmploymentOfferFormFields = () => {
    if (document.body.contains(document.querySelector('.js-EmploymentOfferForm'))) {
        const hasSalarySetBool = document.querySelector('.js-hasSalarySetBool');
        const salaryField = document.querySelector('.js-salaryField');
        const salaryFieldWrapper = document.querySelector('.js-salaryFieldWrapper');
        const salaryPeriodField = document.querySelector('.js-salaryPeriodField');
        const salaryPeriodFieldWrapper = document.querySelector('.js-salaryPeriodFieldWrapper');
        
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

        // Affichage initial ou après un render "new" des champs liés au salaire
        if (hasSalarySetBool.checked === false) { // Si "has_salary_set" est false
            hideSalaryField();
            hideSalaryPeriodField();
        } else if (hasSalarySetBool.checked) { // Si "has_salary_set" est true
            displaySalaryField();
            displaySalaryPeriodField();
        }
        
        hasSalarySetBool.addEventListener('change', function() {
            if (this.checked ) {
                displaySalaryField();
                displaySalaryPeriodField();
            } else if (this.checked === false) {
                hideSalaryField();
                hideSalaryPeriodField();
            }
        });

    }
}

export { dynamicsEmploymentOfferFormFields };