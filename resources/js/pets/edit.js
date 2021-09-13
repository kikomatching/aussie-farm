import PetEdit from "./modules/PetEdit";

$('#form__edit-pet').on('submit', function(e) {
    e.preventDefault();

    $('.alert-danger').css('display', 'none');

    var id = $('#pet_id').val()
    var formData = new FormData(document.getElementById('form__edit-pet'));

    // Hard coded for now since we only have one pet type id which is kangaroos
    formData.append('pet_type_id', 1);

    var data = {};

    for(var pair of formData.entries()) {
        data[pair[0]] = pair[1];
    }

    fetch('/api/v1/pets/' + id, {
        method: 'put',
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
                showSuccessAlert(response.message)
            }
        });
});

function showSuccessAlert(message) {
    $('.alert-success').css('display', 'block');
    $('#alert-success__message').html(message);

    setTimeout(() => {
        $('.alert-success').css('display', 'none');
    }, 5000)
}

function showErrorAlert(errors) {
    $('.alert-danger').css('display', 'block');

    errors.forEach(element => {
        $('#error-list').append('<li>' + element + '</li>');
    });
}
