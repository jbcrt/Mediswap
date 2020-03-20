const autoResizeTextarea = () => {
    const textareas = document.querySelectorAll('.js-autoResizeTextarea');
    if (textareas.length > 0) {
        textareas.forEach( textarea => {
            if (textarea.content !== "") {
                textarea.style.height = (textarea.scrollHeight)+"px";
            }
            textarea.addEventListener("input" , function() {
                textarea.style.height = "auto";
                textarea.style.height = (textarea.scrollHeight)+"px";
            });
        })
    }
}

export { autoResizeTextarea };