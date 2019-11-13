$(document).on('turbolinks:load', function () {
    $("#conversation_recipient").chosen({
        no_results_text: 'No results matched',
        placeholder_text_single: "Select Recipient"
    });

});