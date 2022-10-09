$(function () {
    function readURL(input) {
        if (input.files) {
            let reader = new FileReader();
            reader.onload = function (e) {
                $(".image-prev").attr("src", e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".file-input").change(function () {
        readURL(this);
    });
});
