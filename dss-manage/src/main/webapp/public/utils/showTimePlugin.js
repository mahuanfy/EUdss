function showTime() {
    let currentTime = new Date();
    let currentYear = currentTime.getFullYear();
    let currentMonth = currentTime.getMonth() + 1;
    let currentDay = currentTime.getDate();  //获取当前天数
    let detailedsDate = currentYear + "年" + currentMonth + "月" + currentDay + "日";

    let time = {
        currentYear:currentYear,
        currentMonth:currentMonth,
        currentDay:currentDay,
        detailedsDate:detailedsDate
    }

    return time;
}