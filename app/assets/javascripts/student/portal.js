$(document).ready(function() {
    if ($('body').hasClass('default-modal-page')) {
        $('#defaultModal').modal({
            backdrop: 'static',
            keyboard: false,
        });
    }
});