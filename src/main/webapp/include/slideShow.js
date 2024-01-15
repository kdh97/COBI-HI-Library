// 슬라이드 쇼 관련 코드
var slideIndex = 0;

document.addEventListener("DOMContentLoaded", function() {
    showSlides(slideIndex);

    var sec = 10000;
    setInterval(function() {
        slideIndex++;
        showSlides(slideIndex);
    }, sec);
});

function moveSlides(n) {
    slideIndex = slideIndex + n;
    showSlides(slideIndex);
}

function currentSlide(n) {
    slideIndex = n;
    showSlides(slideIndex);
}

function showSlides(n) {
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    var size = slides.length;

    if ((n + 1) > size) {
        slideIndex = 0;
        n = 0;
    } else if (n < 0) {
        slideIndex = (size - 1);
        n = (size - 1);
    }

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }

    slides[n].style.display = "block";
    dots[n].className += " active";
}