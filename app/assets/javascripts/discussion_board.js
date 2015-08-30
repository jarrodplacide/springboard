$(document).ready(function() {
    var body = $('body');

    if((body).hasClass('discussion-board') && (body).hasClass('show') && (body).hasClass('thread')) {
        $('#top-add-thread-post-button').click(function() {
            $('#top-add-thread-post-form').toggleClass('hidden');
        });

        $('#bottom-add-thread-post-button').click(function() {
            $('#bottom-add-thread-post-form').toggleClass('hidden');
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