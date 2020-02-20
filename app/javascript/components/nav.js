const profileEditNavbar = () => {
    const professionalUserEditMenu = document.querySelector('.js-professionalUserEditMenu');
    const facilityUserEditMenu = document.querySelector('.js-facilityUserEditMenu');
    if (document.body.contains(professionalUserEditMenu)) {
        const credentialsBtnMin = document.querySelector('.js-profileMenuMinCredentialsBtn');
        const personalInformationsBtnMin = document.querySelector('.js-profileMenuMinPersonalInformationsBtn');
        const professionalInformationsBtnMin = document.querySelector('.js-profileMenuMinProfessionalInformationsBtn');
        const manageAccountBtnMin = document.querySelector('.js-profileMenuMinManageAccountBtn');

        const credentialsBtnMax = document.querySelector('.js-profileMenuMaxCredentialsBtn');
        const personalInformationsBtnMax = document.querySelector('.js-profileMenuMaxPersonalInformationsBtn');
        const professionalInformationsBtnMax = document.querySelector('.js-profileMenuMaxProfessionalInformationsBtn');
        const manageAccountBtnMax = document.querySelector('.js-profileMenuMaxManageAccountBtn');

        const credentialsDiv = document.querySelector('.js-profileCredentialsDiv');
        const personalInformationsDiv = document.querySelector('.js-profilePersonalInformationsDiv');
        const professionalInformationsDiv = document.querySelector('.js-profileProfessionalInformationsDiv');
        const manageAccountDiv = document.querySelector('.js-profileManageAccountDiv');

        credentialsBtnMin.addEventListener('click', () => {
            credentialsBtnMin.classList.add("active");
            personalInformationsBtnMin.classList.remove("active");
            professionalInformationsBtnMin.classList.remove("active");
            manageAccountBtnMin.classList.remove("active");

            credentialsDiv.classList.remove("d-none");
            personalInformationsDiv.classList.add("d-none");
            professionalInformationsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        personalInformationsBtnMin.addEventListener('click', () => {
            personalInformationsBtnMin.classList.add("active");
            credentialsBtnMin.classList.remove("active");
            professionalInformationsBtnMin.classList.remove("active");
            manageAccountBtnMin.classList.remove("active");

            personalInformationsDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            professionalInformationsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        professionalInformationsBtnMin.addEventListener('click', () => {
            professionalInformationsBtnMin.classList.add("active");
            credentialsBtnMin.classList.remove("active");
            personalInformationsBtnMin.classList.remove("active");
            manageAccountBtnMin.classList.remove("active");

            professionalInformationsDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            personalInformationsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        manageAccountBtnMin.addEventListener('click', () => {
            manageAccountBtnMin.classList.add("active");
            credentialsBtnMin.classList.remove("active");
            personalInformationsBtnMin.classList.remove("active");
            professionalInformationsBtnMin.classList.remove("active");

            manageAccountDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            personalInformationsDiv.classList.add("d-none");
            professionalInformationsDiv.classList.add("d-none");
        });
        
        credentialsBtnMax.addEventListener('click', () => {
            credentialsBtnMax.classList.add("active");
            personalInformationsBtnMax.classList.remove("active");
            professionalInformationsBtnMax.classList.remove("active");
            manageAccountBtnMax.classList.remove("active");

            credentialsDiv.classList.remove("d-none");
            personalInformationsDiv.classList.add("d-none");
            professionalInformationsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        personalInformationsBtnMax.addEventListener('click', () => {
            personalInformationsBtnMax.classList.add("active");
            credentialsBtnMax.classList.remove("active");
            professionalInformationsBtnMax.classList.remove("active");
            manageAccountBtnMax.classList.remove("active");

            personalInformationsDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            professionalInformationsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        professionalInformationsBtnMax.addEventListener('click', () => {
            professionalInformationsBtnMax.classList.add("active");
            credentialsBtnMax.classList.remove("active");
            personalInformationsBtnMax.classList.remove("active");
            manageAccountBtnMax.classList.remove("active");

            professionalInformationsDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            personalInformationsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        manageAccountBtnMax.addEventListener('click', () => {
            manageAccountBtnMax.classList.add("active");
            credentialsBtnMax.classList.remove("active");
            personalInformationsBtnMax.classList.remove("active");
            professionalInformationsBtnMax.classList.remove("active");

            manageAccountDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            personalInformationsDiv.classList.add("d-none");
            professionalInformationsDiv.classList.add("d-none");
        });
    } else if (document.body.contains(facilityUserEditMenu)) {
        const credentialsBtnMin = document.querySelector('.js-profileMenuMinCredentialsBtn');
        const personalInformationsBtnMin = document.querySelector('.js-profileMenuMinPersonalInformationsBtn');
        const manageAccountBtnMin = document.querySelector('.js-profileMenuMinManageAccountBtn');

        const credentialsBtnMax = document.querySelector('.js-profileMenuMaxCredentialsBtn');
        const personalInformationsBtnMax = document.querySelector('.js-profileMenuMaxPersonalInformationsBtn');
        const manageAccountBtnMax = document.querySelector('.js-profileMenuMaxManageAccountBtn');

        const credentialsDiv = document.querySelector('.js-profileCredentialsDiv');
        const personalInformationsDiv = document.querySelector('.js-profilePersonalInformationsDiv');
        const manageAccountDiv = document.querySelector('.js-profileManageAccountDiv');

        credentialsBtnMin.addEventListener('click', () => {
            credentialsBtnMin.classList.add("active");
            personalInformationsBtnMin.classList.remove("active");
            manageAccountBtnMin.classList.remove("active");

            credentialsDiv.classList.remove("d-none");
            personalInformationsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        personalInformationsBtnMin.addEventListener('click', () => {
            personalInformationsBtnMin.classList.add("active");
            credentialsBtnMin.classList.remove("active");
            manageAccountBtnMin.classList.remove("active");

            personalInformationsDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        manageAccountBtnMin.addEventListener('click', () => {
            manageAccountBtnMin.classList.add("active");
            credentialsBtnMin.classList.remove("active");
            personalInformationsBtnMin.classList.remove("active");

            manageAccountDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            personalInformationsDiv.classList.add("d-none");
        });
        
        credentialsBtnMax.addEventListener('click', () => {
            credentialsBtnMax.classList.add("active");
            personalInformationsBtnMax.classList.remove("active");
            manageAccountBtnMax.classList.remove("active");

            credentialsDiv.classList.remove("d-none");
            personalInformationsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        personalInformationsBtnMax.addEventListener('click', () => {
            personalInformationsBtnMax.classList.add("active");
            credentialsBtnMax.classList.remove("active");
            manageAccountBtnMax.classList.remove("active");

            personalInformationsDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            manageAccountDiv.classList.add("d-none");
        });

        manageAccountBtnMax.addEventListener('click', () => {
            manageAccountBtnMax.classList.add("active");
            credentialsBtnMax.classList.remove("active");
            personalInformationsBtnMax.classList.remove("active");

            manageAccountDiv.classList.remove("d-none");
            credentialsDiv.classList.add("d-none");
            personalInformationsDiv.classList.add("d-none");
        });
    }
}

export { profileEditNavbar };