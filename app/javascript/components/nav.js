
const profileEditNavbar = () => {
    const profileMenu = document.querySelector('.js-profileMenu');
    if (document.body.contains(profileMenu)) {
        const editBtnMin = document.querySelector('.js-profileMenuMinEditBtn');
        const manageBtnMin = document.querySelector('.js-profileMenuMinManageBtn');
        const editBtnMax = document.querySelector('.js-profileMenuMaxEditBtn');
        const manageBtnMax = document.querySelector('.js-profileMenuMaxManageBtn');
        const editDiv = document.querySelector('.js-profileEditDiv');
        const manageDiv = document.querySelector('.js-profileManageDiv');

        editBtnMin.addEventListener('click', () => {
            editBtnMin.classList.add("active");
            manageBtnMin.classList.remove("active");
            editDiv.classList.remove("d-none");
            manageDiv.classList.add("d-none");
        });
        manageBtnMin.addEventListener('click', () => {
            manageBtnMin.classList.add("active");
            editBtnMin.classList.remove("active");
            manageDiv.classList.remove("d-none");
            editDiv.classList.add("d-none");
        });
        editBtnMax.addEventListener('click', () => {
            editBtnMax.classList.add("active");
            manageBtnMax.classList.remove("active");
            editDiv.classList.remove("d-none");
            manageDiv.classList.add("d-none");
        });
        manageBtnMax.addEventListener('click', () => {
            manageBtnMax.classList.add("active");
            editBtnMax.classList.remove("active");
            manageDiv.classList.remove("d-none");
            editDiv.classList.add("d-none");
        });
    }
}

export { profileEditNavbar };