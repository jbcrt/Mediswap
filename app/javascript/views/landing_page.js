const addShadowToSelect2 = () => {
    if (document.body.contains(document.querySelector('.js-landingSearchBar'))) {
        const select2Container = document.querySelector(".select2-container")
        select2Container.classList.add("shadow");
    }
}

export { addShadowToSelect2 };