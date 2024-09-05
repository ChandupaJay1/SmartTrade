var modelList;
async function loadFeatures() {

    const response = await fetch(
            "LoadFeatures"
            );

    if (response.ok) {
        const json = await response.json();

        const categoryList = json.categoryList;
        modelList = json.modelList;
        const colorList = json.colorList;
        const storageList = json.storageList;
        const conditionList = json.conditionList;

        loadSelect("select-category", categoryList, ["id", "name"]);
//        loadSelect("select-model", modelList, ["id", "name"]);
        loadSelect("select-color", colorList, ["id", "name"]);
        loadSelect("select-storage", storageList, ["id", "value"]);
        loadSelect("select-condition", conditionList, ["id", "name"]);


        if (json.success) {

        } else {

        }

    } else {
        document.getElementById("message").innerHTML = "Please try again Later ";
    }
}

function loadSelect(selectTagId, list, propertyArray) {

    const SelectTag = document.getElementById(selectTagId);
    list.forEach(item => {
        let optionTag = document.createElement("option");
        optionTag.value = item[propertyArray[0]];
        optionTag.innerHTML = item[propertyArray[1]];
        SelectTag.appendChild(optionTag)
    });

}

function updateModels() {
    let modelSelectTag = document.getElementById("select-model");
    modelSelectTag.length = 1;
    let selectedCategoryId = document.getElementById("select-category").value;



    modelList.forEach(model => {
        if (model.category.id == selectedCategoryId) {
            let optionTag = document.createElement("option");
            optionTag.value = model.id;
            optionTag.innerHTML = model.name;
            modelSelectTag.appendChild(optionTag);
        }
    });

}

async  function productListing() {

    const category_id = document.getElementById("select-category");
    const model_id = document.getElementById("select-model");
    const storage_id = document.getElementById("select-storage");
    const color_id = document.getElementById("select-color");
    const condition_id = document.getElementById("select-condition");
    const title = document.getElementById("title");
    const description = document.getElementById("description");
    const price = document.getElementById("price");
    const quantity = document.getElementById("quantity");
    const image1Tag = document.getElementById("image1");
    const image2Tag = document.getElementById("image2");
    const image3Tag = document.getElementById("image3");

    const data = new FormData();
    data.append("category_id", category_id.value);
    data.append("model_id", model_id.value);
    data.append("storage_id", storage_id.value);
    data.append("color_id", color_id.value);
    data.append("title", title.value);
    data.append("description", description.value);
    data.append("price", price.value);
    data.append("condition_id", condition_id.value);
    data.append("quantity", quantity.value);
    data.append("image1", image1Tag.files[0]);
    data.append("image2", image2Tag.files[0]);
    data.append("image3", image3Tag.files[0]);


    const response = await fetch(
            "ProductListing",
            {
                method: "POST",
                body: data
            }
    );

    if (response.ok) {
        const json = await response.json();

        console.log(json);

        if (json.success) {



        } else {
            console.log(json.content);
        }

    } else {
//        document.getElementById("message").innerHTML = "Please try again Later ";
    }

}