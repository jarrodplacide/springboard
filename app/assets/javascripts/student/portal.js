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

    if((body).hasClass('renew-subscription')) {
        $('#renew-subscription-button').click(function() {
            $('#renew-subscription-panel').toggleClass('hidden');
        });
    }

    if((body).hasClass('offline-payment-instructions')) {
        $('#payment-months-select').click(function() {
            var months = $('#payment_months').val();
            var payment_amt = course_cost * months;
            $('#payment-instructions').fadeIn('slow', function() {
                $('#payment-amount').html(payment_amt);
            });
        });
    }

    if((body).hasClass('e-payment')) {
        var months, tt_cost, checkout_total;
        $('#payment-months-select').click(function() {
            $('#checkout-form').fadeIn('slow', function() {
                months = $('#payment_months').val();
                tt_cost = course_cost * months;
                checkout_total = +((tt_cost / exchange_rate).toFixed(2));
                $('#months').html(months);
                $('#payment_amount').html(tt_cost);
            });
        });

        var successCallBack = function(data) {
            var ccForm = $('#credit-card-form');
            $('#token').val(data.response.token.token);
            $('#tt_total').val(tt_cost * 100);
            $('#total').val(checkout_total);
            $('#no_of_months').val(months);
            ccForm.fadeOut('slow', function() {
                $('#billing-address-form').fadeIn('slow');
            });
        };

        var errorCallBack = function(data) {
            if (data.errorCode === 200) {
                alert('Communication with Server Failed. Please try again');
            } else {
                alert(data.errorMsg);
            }
        };

        var tokenRequest = function() {
            var args = {
                sellerId: "901292025",
                publishableKey: "CC3B7D33-FFFF-4830-8FF8-901695031930",
                ccNo: $('#ccNo').val(),
                cvv: $('#cvv').val(),
                expMonth: $('#expMonth').val(),
                expYear: $('#expYear').val()
            };

            TCO.requestToken(successCallBack, errorCallBack, args);
        };

        $(function() {
            TCO.loadPubKey('sandbox');

            $('#credit-card-form').submit(function(e) {
                tokenRequest();

                return false;
            });
        });
    }
});