const autoCalculateRetrocession = () => {
    if (document.body.contains(document.querySelector('.js-candidateRetrocession'))) {
        const candidateRetrocession = document.querySelector('.js-candidateRetrocession');
        const recruiterRetrocession = document.querySelector('.js-recruiterRetrocession');
        candidateRetrocession.addEventListener("input" , function() {
            if (Number.isInteger(parseInt(candidateRetrocession.value))) {
                recruiterRetrocession.innerHTML = 100 - candidateRetrocession.value
            } else {
                recruiterRetrocession.innerHTML = ""
            }
        });
    }
}

export { autoCalculateRetrocession };