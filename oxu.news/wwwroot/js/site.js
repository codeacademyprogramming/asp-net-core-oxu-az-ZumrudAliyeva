let sliderCount = 0;

$(document).on("click", ".prev", function () {
    if (sliderCount == ($(".featured-i").length - 1)) {
        sliderCount = 0;
    }
    else {
        sliderCount++;
    }
    $(".featured-i.active").removeClass("active");
    $(".featured-i").eq(sliderCount).addClass("active");
});
$(document).on("click", ".next", function () {
    if (sliderCount == 0) {
        sliderCount = $(".featured-i").length - 1;
    }
    else {
        sliderCount--;
    }
    $(".featured-i.active").removeClass("active");
    $(".featured-i").eq(sliderCount).addClass("active");


});


let slides = document.querySelectorAll('.featured-i');
var currentSlide = 0;
sliderCount = 0;
var slideInterval = setInterval(nextSlide, 3000);

function nextSlide() {
    if (sliderCount == ($(".featured-i").length - 1)) {
        sliderCount = 0;
    }
    else {
        sliderCount++;
    }
    slides[currentSlide].classList.toggle('active')
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].classList.toggle('active')
}