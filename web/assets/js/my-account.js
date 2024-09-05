async function loadFeatures() {

    const response = await fetch(
            "LoadFeatures"
            );

    if (response.ok) {
        const json = await response.json();

        console.log(json);

        if (json.success) {

            window.location = "index.html";

        } else {

        }

    } else {


        document.getElementById("message").innerHTML = "Please try again Later ";
    }

}

