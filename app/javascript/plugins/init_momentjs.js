import moment from 'moment';
moment.locale('fr');

const initMomentSinceDuration = () => {
    const durations = document.querySelectorAll(".js-sinceDuration")
    if (durations.length > 0) {
        durations.forEach(duration => {
            if (duration.dataset.sinceDurationSet === undefined) {
              duration.innerHTML = moment(duration.innerHTML).fromNow()
              // Idempotent transformation for turbolinks
              duration.dataset.sinceDurationSet = true
            }
        });
      }
}

export { initMomentSinceDuration };