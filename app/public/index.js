const model_center = document.getElementById("model-center");
const model_left = document.getElementById("model-left");
const model_right = document.getElementById("model-right");
const select_brand = document.getElementById("select-brand");
const select_model = document.getElementById("select-model");
const registration = document.getElementById("registration");
const description = document.getElementById("description");
const json_colors = document.getElementById("json-colors");
const btn_form_car_save = document.getElementById("btn-form-car-save");
const btn_form_car_next = document.getElementById("btn-form-car-next");
const car_id = document.getElementById("car_id");
const modal = document.querySelector(".modal");
const item_color_name = document.getElementById("item-color-name");
const add_new_color = document.getElementById("add_new_color");
const body_items = document.getElementById("body-items");
const act_brand_name = document.getElementById("act-brand-name");
const act_select_brand = document.getElementById("act-select-brand");
const act_model_name = document.getElementById("act-model-name");
const btn_return_form_car = document.querySelector(".btn-return-form-car");
const form_assign_place_parking = document.querySelector(
  ".form-assign-place-parking"
);
const form_brand_model_actions = document.querySelector(
  ".form-brand-model-actions"
);

let floor_for_assign = 0;
let place_for_assign = 0;

function update_floor(floor) {
  model_center.innerText = `PISO ${floor}`;
  update_button_floor(floor);
  data_parking_by_floor(floor);
}

function update_button_floor(floor) {
  for (x = 0; x < 5; x++) {
    const element = document.getElementById(`floor-btn-${x + 1}`);
    element.classList.remove("active");
  }
  const element = document.getElementById(`floor-btn-${floor}`);
  element.classList.add("active");
}

function prepare_table_model(places_occupied = [], floor) {
  print_table_model(model_left, floor, places_occupied, 1);

  print_table_model(model_right, floor, places_occupied, 6);
}

function data_parking_by_floor(floor) {
  fetch(`/app/controllers/parking.php?floor=${floor}`)
    .then((response) => response.json())
    .then((collection) => prepare_table_model(collection, floor));
}

function print_table_model(model, floor, places_occupied, index_place) {
  model.innerHTML = "";

  for (x = 0; x < 5; x++) {
    let desing_occupied = `
        <div>
          <div class="check-unoccupied" onclick="assign_place_parking(${floor}, ${
      x + index_place
    })">
            <span>Disponible</span>
            <span>Asignar</span>
          </div>
        </div>
      `;

    const occupied = places_occupied.find((place) => {
      return parseInt(place.place, 10) === x + index_place;
    });

    if (occupied !== undefined) {
      desing_occupied = `
          <div>
            <div class="check-occupied" onclick="free_place_parking('${occupied.id}', ${floor})">
              <span>Ocupado</span>
              <span>Liberar</span>
            </div>
            <div class="registration">${occupied.car.registration}</div>
          </div>
        `;
    }

    model.innerHTML += `
        <div class="space">
          <div class="content-space">
            <div class="number-space">${x + index_place}</div>
            ${desing_occupied}
          </div>
        </div>
      `;
  }
}

function get_all_brand() {
  fetch("/app/controllers/brand.php")
    .then((response) => response.json())
    .then((collection) => hidrate_select_brand(collection));
}

function hidrate_select_brand(brands = []) {
  let option_brands = "<option disabled selected>SELECCION MARCA</option>";
  for (const brand of brands) {
    option_brands += `
        <option value="${brand.id}">${brand.name}</option>
      `;
  }
  select_brand.innerHTML = option_brands;
  act_select_brand.innerHTML = option_brands;
}

function get_model_by_brand() {
  fetch(`/app/controllers/model.php?brand_id=${select_brand.value}`)
    .then((response) => response.json())
    .then((collection) => hidrate_select_model(collection));
}

function hidrate_select_model(models = []) {
  let option_models = "";
  for (const model of models) {
    option_models += `
        <option value="${model.id}">${model.name}</option>
      `;
  }
  select_model.innerHTML = option_models;
}

function load_car_form() {
  if (registration.value.length == 7) {
    block_form();
    btn_form_car_save.removeAttribute("disabled");
    fetch(`/app/controllers/car.php?registration=${registration.value}`)
      .then((response) => response.json())
      .then((collection) => {
        if (Object.keys(collection).length > 0) {
          description.value = collection.description;
          select_brand.value = collection.model.brand.id;
          get_model_by_brand();
          setTimeout(() => {
            select_model.value = collection.model.id;
          }, 10);
          const colors = [];
          for (const color of collection.colors) {
            colors.push(color.name);
          }
          json_colors.value = JSON.stringify(colors);
          update_item_color(colors);
          car_id.value = collection.id;
          btn_form_car_next.removeAttribute("disabled");
        }
      });
  }
}

function save_car() {
  if (car_id.value.length == 0) {
    save_new_car();
  } else {
    save_update_car();
  }
}

function save_new_car() {
  const formData = new FormData();
  formData.append("registration", registration.value.toUpperCase());
  formData.append("description", description.value);
  formData.append("model_id", select_model.value);
  formData.append("json_colors", json_colors.value);

  fetch("/app/controllers/car.php", {
    method: "POST",
    body: formData,
  })
    .then((response) => response.json())
    .then((response) => {
      console.log(response);
      car_id.value = response.id;
      btn_form_car_save.setAttribute("disabled", true);
      btn_form_car_next.removeAttribute("disabled");
    })
    .catch((err) => console.log(err));
}

function save_update_car() {
  let formBody = urlencoded({
    registration: registration.value.toUpperCase(),
    description: description.value,
    model_id: select_model.value,
    json_colors: json_colors.value,
  });

  fetch("/app/controllers/car.php", {
    method: "PUT",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8",
    },
    body: formBody,
  })
    .then((response) => response.text())
    .then((response) => {
      console.log(response);
      btn_form_car_save.setAttribute("disabled", true);
    })
    .catch((err) => console.log(err));
}

function assign_place_parking(floor, place) {
  floor_for_assign = floor;
  place_for_assign = place;
  open_modal(1);
}

function save_assign_place_parking() {
  if (car_id.value.length > 0) {
    const formData = new FormData();
    formData.append("floor", floor_for_assign);
    formData.append("place", place_for_assign);
    formData.append("car_id", car_id.value);

    fetch("/app/controllers/parking.php", {
      method: "POST",
      body: formData,
    })
      .then((response) => response.json())
      .then((response) => {
        console.log(response);
        update_floor(floor_for_assign);
        close_modal();
      })
      .catch((err) => console.log(err));
  }
}

function free_place_parking(id, floor) {
  if (confirm("Confirmar liberacion del puesto.") == true) {
    let formBody = urlencoded({ id });
    fetch("/app/controllers/parking.php", {
      method: "PUT",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8",
      },
      body: formBody,
    })
      .then((response) => response.text())
      .then((response) => {
        console.log(response);
        update_floor(floor);
      })
      .catch((err) => console.log(err));
  }
}

function open_modal(form_type) {
  modal.classList.add("modal-active");
  if (form_type === 2) {
    form_assign_place_parking.classList.add("form-close");
    form_brand_model_actions.classList.add("form-open");
  }
}

function close_modal() {
  modal.classList.remove("modal-active");
  clear_form_car();
  close_form_brand_model_from_car();
}

function block_form() {
  registration.setAttribute("disabled", true);
}

function clear_form_car() {
  registration.removeAttribute("disabled");
  registration.value = null;
  description.value = null;
  get_all_brand();
  select_model.innerHTML = null;
  item_color_name.value = null;
  json_colors.value = "[]";
  update_item_color([]);
  car_id.value = null;
  btn_form_car_save.setAttribute("disabled", true);
  btn_form_car_next.setAttribute("disabled", true);
}

function open_form_brand_model_from_car() {
  btn_return_form_car.classList.add("btn-return-form-car-active");
  form_assign_place_parking.classList.add("form-close");
  form_brand_model_actions.classList.add("form-open");
}

function close_form_brand_model_from_car() {
  btn_return_form_car.classList.remove("btn-return-form-car-active");
  form_assign_place_parking.classList.remove("form-close");
  form_brand_model_actions.classList.remove("form-open");
}

function save_new_brand() {
  if (act_brand_name.value.length > 0) {
    const formData = new FormData();
    formData.append("name", act_brand_name.value);
    fetch("/app/controllers/brand.php", {
      method: "POST",
      body: formData,
    })
      .then((response) => response.json())
      .then((response) => {
        console.log(response);
        act_brand_name.value = null;
        get_all_brand();
      })
      .catch((err) => console.log(err));
  }
}

function save_new_model() {
  if (act_model_name.value.length > 0) {
    const formData = new FormData();
    formData.append("name", act_model_name.value);
    formData.append("brand_id", act_select_brand.value);
    fetch("/app/controllers/brand.php", {
      method: "POST",
      body: formData,
    })
      .then((response) => response.json())
      .then((response) => {
        console.log(response);
        act_model_name.value = null;
        get_all_brand();
      })
      .catch((err) => console.log(err));
  }
}

update_floor(1);
get_all_brand();

// ------- LIST COLORS (COMPONENT) ------- //

function add_item_color() {
  const obj_json_colors = JSON.parse(json_colors.value);
  obj_json_colors.push(item_color_name.value);
  item_color_name.value = null;
  json_colors.value = JSON.stringify(obj_json_colors);
  update_item_color(obj_json_colors);
}

function remove_item_color(index) {
  const obj_json_colors = JSON.parse(json_colors.value);
  obj_json_colors.splice(index, 1);
  json_colors.value = JSON.stringify(obj_json_colors);
  update_item_color(obj_json_colors);
}

function update_item_color(colors) {
  if (!add_new_color.hasAttribute("disabled")) {
    let items_color = "";
    for (const [index, color] of colors.entries()) {
      items_color += `
          <div class="item">
            <span>${color}</span>
            <div class="btn-remove-item" onclick="remove_item_color(${index})">
              <i class="fa fa-close"></i>
            </div>
          </div>
        `;
    }
    body_items.innerHTML = items_color;
  }
}

// ------- TOOLS ------- //

function urlencoded(properties) {
  let formBody = [];
  for (let property in properties) {
    let encodedKey = encodeURIComponent(property);
    let encodedValue = encodeURIComponent(properties[property]);
    formBody.push(encodedKey + "=" + encodedValue);
  }
  return formBody.join("&");
}
