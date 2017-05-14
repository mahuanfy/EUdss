/**
 * Created by pc on 17-4-27.
 */
// 菜单点击时间事件
$(function () {
    $(".a_click2").addClass("index_acolor");
    $("#secondary_menu").hide();
    $("#secondary").click(function () {
        $("#secondary_menu").fadeToggle(200);
        if ($(".huan").hasClass("layui-nav-itemed")) {
            $(".huan").removeClass("layui-nav-itemed");
        } else {
        }
    });
// 外层点击事件
    $("li").click(function () {
        var index = $(this).index();

        if ($(this).hasClass("huan")) {

        } else {
            $("li").removeClass("index_acolor");
            $("dd").removeClass("index_acolor");
            $("li").eq(index - 2).addClass("index_acolor");
        }
    });
//二级菜单点击事件
    $("dd").click(function () {
        var index1 = $(this).index();
        $("li").removeClass("index_acolor");
        $("dd").removeClass("index_acolor");
        $("dd").eq(index1).addClass("index_acolor");

    });
});
