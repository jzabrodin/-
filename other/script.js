function $(id) {
    return document.getElementById(id);
}

function loadImage() {
    $("downloaded_image").src = $("image_url").value;
}

function getRequest(url,method){

    if (url === null || url === ""){
        console.error("URL IS INVALID!")
        return null;
    }

    if (method !== "GET" || method !== "POST"){
        console.error("METHOD IS not acceptable")
        return null;
    }

    var xhr = new XMLHttpRequest();
    xhr.open(method,url,true);
    xhr.send();

    return xhr;

}

// xhr - xml http request
function operateRequest(xhr){

    if (xhr === null){
        console.error("XHR - null");
        return false;
    }

    xhr.onreadystatechange = function () {
        if (xhr.readyState != 4){return}

    }

}