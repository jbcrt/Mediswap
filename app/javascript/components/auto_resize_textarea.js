const autoResizeTextarea = () => {
    const textarea = document.querySelector('.js-autoResizeTextarea');
    if (document.body.contains(textarea)) {
        if (textarea.content !== "") {
            textarea.style.height = (textarea.scrollHeight)+"px";
        }
        textarea.addEventListener("input" , function() {
            textarea.style.height = "auto";
            textarea.style.height = (textarea.scrollHeight)+"px";
        });
    }
}

export { autoResizeTextarea };