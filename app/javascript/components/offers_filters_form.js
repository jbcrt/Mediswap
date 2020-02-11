const cleanOffersFiltersForm = () => {
    const offersFiltersForm = document.querySelector('.js-offersFiltersForm');
    if (document.body.contains(offersFiltersForm)) {
        document.querySelector(".js-resetOffersFiltersFormBtn").addEventListener("click" , function() {
            offersFiltersForm.elements[6].value = "";
            offersFiltersForm.elements[7].selectedIndex = -1;
            offersFiltersForm.elements[8].value = "";
            offersFiltersForm.elements[9].value = "";
        });
    }
}

export { cleanOffersFiltersForm };