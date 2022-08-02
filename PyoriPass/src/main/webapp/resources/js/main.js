// join1에 비밀번호 일치 확인

$('.join1_pw').keyup(() => {
	let pw1 = $("#join1_password").val();
	let pw2 = $("#join1_password2").val();

	if(pw1 != "" || pw2 != ""){
		if(pw1 == pw2){
			$("#same").html('비밀번호가 일치합니다.');
			$("#same").css("color", "green");
		}else {
			$("#same").html('비밀번호가 일치하지 않습니다.');
			$("#same").css("color", "red");
		}
	}
});


// join1에 제품번호 일치 확인

$('.product_num').on("input", function() {
	if ($(this).val().trim().length == 0) {
        $("same2").text("");
        return;
    }
    const regExp = /^[a-z][A-Za-z\d\-\_]{12,13}$/;  //영어 대/소문자, 숫자, -, _로만 이루어진 13~14글자 사이 문자열

    if (regExp.test($(this).val())) {
        $("#same2").text("정상입력되었습니다.");
        $("#same2").css("color", "green");
        
      } else {
        $("#same2").html("영어 대/소문자, 숫자, -,_로만 이루어진<br> 13~14글자 사이 문자열을 입력해주세요.");
        $("#same2").css("color", "red");
      }
});





(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.sticky-top').css('top', '0px');
        } else {
            $('.sticky-top').css('top', '-100px');
        }
    });
    
    
    // Dropdown on mouse hover
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";
    
    $(window).on("load resize", function() {
        if (this.matchMedia("(min-width: 992px)").matches) {
            $dropdown.hover(
            function() {
                const $this = $(this);
                $this.addClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "true");
                $this.find($dropdownMenu).addClass(showClass);
            },
            function() {
                const $this = $(this);
                $this.removeClass(showClass);
                $this.find($dropdownToggle).attr("aria-expanded", "false");
                $this.find($dropdownMenu).removeClass(showClass);
            }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Header carousel
    $(".header-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        items: 1,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ]
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: true,
        margin: 24,
        dots: true,
        loop: true,
        nav : false,
        responsive: {
            0:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });
    
})(jQuery);

