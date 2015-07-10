$(document).ready(function() {
    var body = $('body');
    if ((body).hasClass('default-modal-page')) {
        $('#defaultModal').modal({
            backdrop: 'static',
            keyboard: false
        });
    }

    if((body).hasClass('student-profile')) {
        $('#edit-profile-button').click(function() {
            $('#edit-profile-panel').toggleClass('hidden');
        });
        $('.edit-parent-button').click(function() {
            var parentid = $(this).data('parentid');
            $('#edit-parent-' + parentid).toggleClass('hidden');
        });
        $('#add-parent-button').click(function() {
            $('#add-parent-panel').toggleClass('hidden');
        });
    }

    if((body).hasClass('payment-options')) {
        $('#offline-payment-button').click(function() {
            $('#offline-payment-panel').toggleClass('hidden');
        });
    }
});