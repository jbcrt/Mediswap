import moment from 'moment';
moment.locale('fr');

const initMomentSinceDuration = () => {
    const durations = document.querySelectorAll(".js-sinceDuration")
    if (durations.length > 0) {
        durations.forEach(duration =>
          duration.innerHTML = moment(duration.innerHTML).fromNow()
        );
      }
}

export { initMomentSinceDuration };