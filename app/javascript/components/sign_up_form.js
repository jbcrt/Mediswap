const dynamicsSignUpFormFields = () => {
    if (document.body.contains(document.querySelector('.js-signUpForm'))) {
        const userTypeRadios = document.querySelectorAll('.js-userTypeRadio');
        const userProfessionField = document.querySelector('.js-userProfessionField');
        const userFacilityNameField = document.querySelector('.js-userFacilityNameField');
        const userFacilityCategoryField = document.querySelector('.js-userFacilityCategoryField');
        
        const displayProfessionField = () => {
            userProfessionField.parentNode.classList.remove("d-none");
            userProfessionField.parentNode.classList.add("d-block");
            userProfessionField.required = true;
        };
        
        const hideProfessionField = () => {
            userProfessionField.parentNode.classList.add("d-none");
            userProfessionField.parentNode.classList.remove("d-block");
            userProfessionField.required = false;
            userProfessionField.value = "";
        };
        
        const displayFacilityNameField = () => {
            userFacilityNameField.parentNode.classList.remove("d-none");
            userFacilityNameField.parentNode.classList.add("d-block");
            userFacilityNameField.required = true;
        };
        
        const hideFacilityNameField = () => {
            userFacilityNameField.parentNode.classList.add("d-none");
            userFacilityNameField.parentNode.classList.remove("d-block");
            userFacilityNameField.required = false;
            userFacilityNameField.value = "";
        };
        
        const displayFacilityCategoryField = () => {
            userFacilityCategoryField.parentNode.classList.remove("d-none");
            userFacilityCategoryField.parentNode.classList.add("d-block");
            userFacilityCategoryField.required = true;
        };
        
        const hideFacilityCategoryField = () => {
            userFacilityCategoryField.parentNode.classList.add("d-none");
            userFacilityCategoryField.parentNode.classList.remove("d-block");
            userFacilityCategoryField.required = false;
            userFacilityCategoryField.value = "";
        };
        
        // Affichage initial ou après un render "new" du formulaire d'inscription
        if ((userTypeRadios[0].checked === false) && (userTypeRadios[1].checked === false)) { // Si aucun type n'est selectionné
            hideProfessionField();
            hideFacilityNameField();
            hideFacilityCategoryField();
        } else if (userTypeRadios[0].checked) { // Si professionnel médical est selectionné
            displayProfessionField();
            hideFacilityNameField();
            hideFacilityCategoryField();
        } else if (userTypeRadios[1].checked) { // Si établissement médical est selectionné
            hideProfessionField();
            displayFacilityNameField();
            displayFacilityCategoryField();
        }

        let prevType = null;
        for (var i = 0; i < userTypeRadios.length; i++) {
            userTypeRadios[i].addEventListener('change', function() {
                if (this !== prevType) {
                    prevType = this;
                }
                if (this.value === "health_professional") {
                    displayProfessionField();
                    hideFacilityNameField();
                    hideFacilityCategoryField();
                } else if (this.value === "health_facility_recruiter") {
                    hideProfessionField();
                    displayFacilityNameField();
                    displayFacilityCategoryField();
                }
            });
        }

    }
}

export { dynamicsSignUpFormFields };