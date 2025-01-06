$(function () {
    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case 'copy':
                var text = "";
                if (event.data.type === "h") {
                    text = event.data.coords.heading
                } else {
                    text = event.data.coords.x + ", " + event.data.coords.y + ", " + event.data.coords.z
                }
                copyStringToClipboard(text);
                break
        }
    });
});

$(function () {
    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case 'copy2':
                var text = "";
                if (event.data.type === "h") {
                    text = event.data.coords.heading
                } else {
                    text = event.data.coords.x + ", " + event.data.coords.y + ", " + event.data.coords.z + ", " + event.data.coords.heading
                }
                copyStringToClipboard(text);
                break
        }
    });
});

function copyStringToClipboard (coords) {
    var text = document.createElement('textarea');
    text.value = coords;
    text.setAttribute('readonly', '');
    text.style = {position: 'absolute', left: '-9999px'};
    document.body.appendChild(text);
    text.select();
    document.execCommand('copy');
    document.body.removeChild(text);
}