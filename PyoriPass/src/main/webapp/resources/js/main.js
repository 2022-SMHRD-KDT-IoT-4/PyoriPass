// 메인타이틀

let h1 = document.getElementById("title_h1");

h1.addEventListener("input", function() {
  this.setAttribute("data-heading", this.innerText);
});



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


// 이메일 인증링크 받기

function join1_email_btn() {
  $.ajax({
    url: 'joinSendEmail.do',
    type : 'post',
    data : {
      
      host_id 

    },
    success : function (res) {

    }
  })
}

