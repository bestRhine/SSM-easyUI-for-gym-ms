$(document).ready(function() {

    var temp = "";

    //进行页面切换
    $("#li-one").click(function () {
        openMatter(1);
    });
    $("#li-two").click(function () {
        openMatter(2);
    });
    $("#li-three").click(function () {
        openMatter(3);
    });
    $("#li-four").click(function () {
        openMatter(4);
    });
    $("#li-five").click(function () {
        openMatter(5);
    });
    function openMatter(obj) {
        for (var i = 1; i < 6; i++) {
            if (i == obj) {
                temp = "block";
            } else {
                temp = "none";
            }
            document.getElementById("matter" + i).style.display = temp;
        }
    }
});