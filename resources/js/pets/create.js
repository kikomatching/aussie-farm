import PetEdit from "./modules/PetEdit";

$('#form__add-pet').on('submit', function(e) {
    e.preventDefault();
    $('.alert-danger').css('display', 'none');

    var formData = new FormData(document.getElementById('form__add-pet'));
    var data = {};

    // Hard coded for now since we only have one pet type id which is kangaroos
    formData.append('pet_type_id', 1);

    for (var pair of formData.entries()) {
        data[pair[0]] = pair[1];
    }

    fetch('/api/v1/pets', {
        method: 'post',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
        .then(response => response.json())
        .then((response) => {
            if (response.errors) {
                showErrorAlert(response.errors)
            } else {
                showSuccessAlert(response)
            }
        });
});

function showSuccessAlert(response) {
    $('.alert-success').css('display', 'block');
    $('#alert-success__message').html(response.message);

    setTimeout(() => {
        window.location = '/pets/' + response.data.id
    }, 2000);
}

function showErrorAlert(errors) {
    $('.alert-danger').css('display', 'block');
    $('#error-list').html('');

    errors.forEach(element => {
        $('#error-list').append('<li>' + element + '</li>');
    });
}
