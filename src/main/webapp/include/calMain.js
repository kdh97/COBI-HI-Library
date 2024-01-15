document.addEventListener("DOMContentLoaded", function() {
    var currentDate = new Date();
    var currentYear = currentDate.getFullYear();
    var currentMonth = currentDate.getMonth();
    var currentMonth1 = currentDate.getMonth() + 1;
    var monthElement = document.getElementById("currentMonth");

    // 두 번째 토요일 날짜 구하기
    var secondSaturday = new Date(currentYear, currentMonth, 1);
    if (secondSaturday.getDay() !== 6) {
        var daysUntilNextSaturday = 6 - secondSaturday.getDay();
        secondSaturday.setDate(secondSaturday.getDate() + daysUntilNextSaturday + 7);
    } else {
        secondSaturday.setDate(secondSaturday.getDate() + 7);
    }
    var secondSaturdayDate = secondSaturday.getDate();

    // 네 번째 토요일 날짜 구하기
    var fourthSaturday = new Date(currentYear, currentMonth, 1);
    if (fourthSaturday.getDay() !== 6) {
        var daysUntilNextSaturday = 6 - fourthSaturday.getDay();
        fourthSaturday.setDate(fourthSaturday.getDate() + daysUntilNextSaturday + 21);
    } else {
        fourthSaturday.setDate(fourthSaturday.getDate() + 21);
    }
    var fourthSaturdayDate = fourthSaturday.getDate();

    var secondSaturdayElement = document.getElementById("secondSaturday");
    if (secondSaturdayElement) {
        secondSaturdayElement.textContent = secondSaturdayDate;
    }

    var fourthSaturdayElement = document.getElementById("fourthSaturday");
    if (fourthSaturdayElement) {
        fourthSaturdayElement.textContent = fourthSaturdayDate;
    }

    if (monthElement) {
        monthElement.textContent = currentMonth1 + "월";
    }
});