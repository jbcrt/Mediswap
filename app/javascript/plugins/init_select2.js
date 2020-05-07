import $ from 'jquery';
import select2 from 'select2';

const initSelect2 = () => {
  const select2 = $('.js-select2');
  if (select2.length) {
    // Empêcher la duplication de Select2 sur un "précédent"
    if (select2.data('select2') == undefined && select2.next().hasClass('select2-container')) {
      select2.next().remove();
    }
    select2.select2({
      theme: "bootstrap",
      width: "100%",
      placeholder: select2.data("placeholder"),
      allowClear: true,
      minimumResultsForSearch: -1
    });
  };
};

const initSelect2Searchable = () => {
  const select2Searchable = $('.js-select2Searchable');
  if (select2Searchable.length) {
    // Empêcher la duplication de Select2 sur un "précédent"
    if (select2Searchable.data('select2') == undefined && select2Searchable.next().hasClass('select2-container')) {
      select2Searchable.next().remove();
    }
    select2Searchable.select2({
      theme: "bootstrap",
      width: "100%",
      placeholder: select2Searchable.data("placeholder"),
      allowClear: true
    });
  };
};

export { initSelect2, initSelect2Searchable };