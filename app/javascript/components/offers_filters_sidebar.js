
const offersFiltersSidebar = () => {
    if (document.body.contains(document.querySelector('.js-offersFiltersSidebar'))) {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
        $('.js-closeFiltersSidebarButton').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    }
}

export { offersFiltersSidebar };