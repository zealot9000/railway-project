$(document).ready(function() {
    $('#new_search').click(function() {
        var start_station;
        var end_station;

        start_station = $(this).find('#search_start_station_id');
        end_station = $(this).find('#search_end_station_id');

        if (start_station.val() == end_station.val()) {
            alert('Одинаковые станции');

            return false;
        }
    });
});