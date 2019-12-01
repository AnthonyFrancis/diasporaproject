$(document).on('turbolinks:load', function () {
    $("#conversation_recipient").chosen({
        no_results_text: 'No results matched',
        max_selected_options: 1
    });

    $(".subscribe-btn").click(function(e){
        $(this).text("Please Wait....").addClass('disabled');
    });
});