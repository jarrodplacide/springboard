$(document).ready(function() {
    var body = $('body');

    if((body).hasClass('discussion-board') && (body).hasClass('show') && (body).hasClass('thread')) {
        $('#top-add-thread-post').click(function() {
            $('#top-add-thread-form').toggleClass('hidden');
        });

        $('#bottom-add-thread-post').click(function() {
            $('#bottom-add-thread-form').toggleClass('hidden');
        });
    }

    if((body).hasClass('discussion-board') && (body).hasClass('index') && (body).hasClass('board-topic')) {
        $('#new-thread-button').click(function() {
            $('#new-thread-form').toggleClass('hidden');
        });
    }

    if((body).hasClass('discussion-board') && (body).hasClass('show')) {
        $('#new-topic-button').click(function() {
            $('#new-topic-form').toggleClass('hidden');
        });
    }
});