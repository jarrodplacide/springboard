$(document).ready(function() {
    if ($('body').hasClass('home-page')) {
        var current_panel = 'about-springboard';
        $('.panel-column').click(function() {
            var clicked_panel = $(this).attr('id');
            if (current_panel != clicked_panel) {
                var height = $(window).height();
                var width = $(window).width();
                $('#background-container').css({'height': height, 'width': width});
                $('#' + current_panel + '-image, #' + current_panel + '-content').fadeOut(1500);
                $('#' + clicked_panel + '-image, #' + clicked_panel + '-content').fadeIn(1500);
                if (clicked_panel != 'about-springboard') {
                    $('.topbar .link').addClass('black-bg-image');
                } else {
                    $('.topbar .link').removeClass('black-bg-image');
                }
                $('#' + current_panel).removeClass('selected');
                $('#' + clicked_panel).addClass('selected');
                current_panel = clicked_panel;
            }
        });
        $(window).resize(function(){
            window.location.href = window.location.href;
        });
    }
});