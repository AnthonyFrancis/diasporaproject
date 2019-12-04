var stripeResponseHandler;

document.addEventListener("turbolinks:load", function() {
    var $form = $('#payment-form');
    $form.find('.subscribe').on('click', payWithStripe);

    function payWithStripe(e){
        e.preventDefault();

        /* Abort if invalid form data */
        if (!validator.form()) {
            return;
        }

        /* Visual feedback */
        $form.find('.subscribe').html('Validating <i class="fa fa-spinner fa-pulse"></i>').prop('disabled', true);

        // create token
        Stripe.setPublishableKey($("meta[name='stripe-key']").attr("content"));
        /* Create token */
        var expiry = $form.find('[name=cardExpiry]').payment('cardExpiryVal');
        var ccData = {
            number: $form.find('[name=cardNumber]').val().replace(/\s/g,''),
            cvc: $form.find('[name=cardCVC]').val(),
            exp_month: expiry.month,
            exp_year: expiry.year
        };

        Stripe.card.createToken(ccData, stripeResponseHandler);
    }

    /* Fancy restrictive input formatting via jQuery.payment library*/
    $('input[name=cardNumber]').payment('formatCardNumber');
    $('input[name=cardCVC]').payment('formatCardCVC');
    $('input[name=cardExpiry]').payment('formatCardExpiry');

    /* Form validation using Stripe client-side validation helpers */
    jQuery.validator.addMethod("cardNumber", function(value, element) {
        return this.optional(element) || Stripe.card.validateCardNumber(value);
    }, "Please specify a valid credit card number.");

    jQuery.validator.addMethod("cardExpiry", function(value, element) {
        /* Parsing month/year uses jQuery.payment library */
        value = $.payment.cardExpiryVal(value);
        return this.optional(element) || Stripe.card.validateExpiry(value.month, value.year);
    }, "Invalid expiration date.");

    jQuery.validator.addMethod("cardCVC", function(value, element) {
        return this.optional(element) || Stripe.card.validateCVC(value);
    }, "Invalid CVC.");

    // validation
    validator = $form.validate({
        rules: {
            cardNumber: {
                required: true,
                cardNumber: true
            },
            cardExpiry: {
                required: true,
                cardExpiry: true
            },
            cardCVC: {
                required: true,
                cardCVC: true
            }
        },
        highlight: function(element) {
            $(element).closest('.form-control').removeClass('success').addClass('error');
        },
        unhighlight: function(element) {
            $(element).closest('.form-control').removeClass('error').addClass('success');
        },
        errorPlacement: function(error, element) {
            $(element).closest('.form-group').append(error);
        }
    });

    $(".use-different-card").click(function(e){
        e.preventDefault();

        $("#ccForm").toggleClass('hidden');
    });
});

jQuery(function() {
});

stripeResponseHandler = function(status, response) {
    var $form, token;
    $form = $('#payment-form');
    if (response.error) {
        /* Visual feedback */
        $form.find('.subscribe').html('Try again').prop('disabled', false);
        /* Show Stripe errors on the form */
        $form.find('.payment-errors').text(response.error.message);
        $form.find('.payment-errors').closest('.row').show();

    } else {
        /* Visual feedback */
        $form.find('.subscribe').html('Processing <i class="fa fa-spinner fa-pulse"></i>');
        /* Hide Stripe errors on the form */
        $form.find('.payment-errors').closest('.row').hide();
        $form.find('.payment-errors').text("");

        token = response.id;
        $form.append($('<input type="hidden" name="stripeToken" />').val(token));
        $form.append($('<input type="hidden" name="card_last4" />').val(response.card.last4));
        $form.append($('<input type="hidden" name="card_exp_month" />').val(response.card.exp_month));
        $form.append($('<input type="hidden" name="card_exp_year" />').val(response.card.exp_year));
        $form.append($('<input type="hidden" name="card_brand" />').val(response.card.brand));
        $form.get(0).submit();
    }
};