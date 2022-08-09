// Rentals_information

document.getElementById('r_btnAdd').addEventListener('click', r_addList);   // 추가
document.getElementById('r_btnDelAll').addEventListener('click', r_delAllEle);   // 전체삭제
document.getElementById('r_DeleteSel').addEventListener('click', r_delSelected);   // 선택 삭제 
document.getElementById('r_btnUpdate').addEventListener('click', r_btnUpdate);   // 선택 수정

let listBox = document.getElementById('list-box');
let r_listBox = document.getElementById('r_list-box');
let host_id = $('#hostId').val();
let list = "";

// 숙소 보기 로드
function loadBoard() {
   console.log(host_id);
   $.ajax({
      url: 'pensionList.do',
      type: 'post',
      data: {
         'host_id': host_id
      },
      success: function (res) {
         showPension(res);
      },
      error: function () {
         alert('error')
      }
   });
}

// 숙소 이름 가져오기
function showPension(res) {
   $('#listBody').html("");

   for (let i = 0; i < res.length; i++) {
      let tr = document.createElement('tr');
      let input = document.createElement('input');
      input.setAttribute('type', 'checkbox');
      input.setAttribute('class', 'btn-chk');
      input.setAttribute('value', res[i].pension_seq);
      let td01 = document.createElement('td');
      td01.appendChild(input);
      tr.appendChild(td01);

      let title = document.createElement('td');
      title.innerHTML = res[i].pension_name;
      title.onclick = () => {
         if (r_listBox.style.display == 'none') {
            r_listBox.style.display = 'block';
         }
         else {
            r_listBox.style.display = 'none';
         }
      }
      tr.appendChild(title);

      document.getElementById('listBody').appendChild(tr);
   }
}

// 숙소 추가
function addList() {
   let pension_name = $('.text-basic').val();
   let content = document.querySelector('.text-basic');

   if (pension_name == null) {
      alert('등록할 숙소명을 입력해주세요.');
      content.focus();
      return false;
   }

   $.ajax({
      url: 'pensionInsert.do',
      type: 'post',
      data: {
         'pension_name': pension_name,
         'host_id': host_id
      },
      success: function (res) {
         let tr = document.createElement('tr');
         let input = document.createElement('input');
         input.setAttribute('type', 'checkbox');
         input.setAttribute('class', 'btn-chk');
         input.setAttribute('value', "");
         let td01 = document.createElement('td');
         td01.appendChild(input);
         tr.appendChild(td01);

         let title = document.createElement('td');
         title.innerHTML = pension_name;
         title.onclick = () => {
            if (r_listBox.style.display == 'none') {
               r_listBox.style.display = 'block';
            }
            else {
               r_listBox.style.display = 'none';
            }
         }
         tr.appendChild(title);

         document.getElementById('listBody').appendChild(tr);
         content.value = '';
         content.focus();
      },
      error: function () {
         alert('숙소 등록 실패!')
      }
   });
}

// 숙소 전체 삭제
function delAllEle() {
   $.ajax({
      url: "pensionAllDelete.do",
      type: 'post',
      data: {
         'host_id': host_id
      },
      success: function (res) {
         let list = document.getElementById('listBody');
         let listChild = list.children;
         for (let i = 0; i < listChild.length; i++) {
            list.removeChild(listChild[i])
            i--;
         }
      },
      error: function () {
         alert('숙소 전체 삭제 실패!')
      }
   });
}

// 숙소 선택 삭제
function delSelected() {
   let body = document.getElementById('listBody');
   let chkbox = document.querySelectorAll('#listBody .btn-chk');
   for (let i in chkbox) {
      if (chkbox[i].nodeType == 1 && chkbox[i].checked == true) {   // 체크확인      
         let pension_seq = chkbox[i].value;
         console.log(pension_seq);
         $.ajax({
            url: 'pensionDelete.do',
            type: 'post',
            data: {
               'pension_seq': pension_seq
            },
            success: function (res) {
               loadBoard()
            },
            error: function () {
               alert('error')
            }
         });
      }
   }
}

// 숙소 선택 수정할 데이터 입력하기
function btnUpdate() {
   let list = document.getElementById('listBody');
   Array.from(list.children).forEach(trItem => {
      if (trItem.querySelector('input').checked) { // 체크박스 체크된 값을 찾고
         let textNode = trItem.childNodes[1]; // 자식 노드 반환
         let text = textNode.innerText;
         trItem.removeChild(textNode); // 적힌걸 지우고 
         let input = document.createElement('input'); // 입력
         input.value = text;
         trItem.appendChild(input);

         $('#btnUpdate').setAttr('id', 'updatebtn');

         updatebtn.onclick = () => {

            let pension_seq = trItem.childNodes[0].childNodes[0].value;
            let pension_name = input.value;

            $.ajax({
               url: 'pensionUpdate.do',
               type: 'post',
               data: {
                  'pension_seq': pension_seq,
                  'pension_name': pension_name
               },
               success: function (res) {
                  loadBoard()
               },
               error: function () {
                  alert('error')
               }
            });
         }
      }
   });
}


//////////// 객실

// 객실 조회
function showRoom() {
   // 선택한 숙소의 pension_seq 주세요
   $.ajax({
      url: 'roomList.do',
      type: 'post',
      data: {
         'pension_seq': pension_seq
      },
      success: function (res) {
         //res : List형태로 나와요(room_seq,pension_seq,room_name)
         console.log(res)
      },
      error: function () {
         alert('객실 조회 에러!')
      }
   });
}


//객실 추가하기
function r_addList() {

   let contents = document.querySelector('.r_text-basic');
   if (!contents.value) {
      alert('추가할 객실을 입력해주세요.');
      contents.focus();
      return false;
   }

   // 객실 추가 기능
   // 선택한 숙소의 pension_seq와 추가할 객실의 이름 room_name 주세요.
   $.ajax({
      url: 'roomInsert.do',
      type: post,
      data: {
         'pension_seq': pension_seq,
         'room_name': room_name
      },
      success: function (res) {
         // res : pension_seq
         showRoom(res)
      },
      error: function () {
         alert('객실 추가 실패!')
      }
   });

   let tr = document.createElement('tr');
   let input = document.createElement('input');
   input.setAttribute('type', 'checkbox');
   input.setAttribute('class', 'r_btn-chk');

   let td01 = document.createElement('td');
   td01.appendChild(input);
   tr.appendChild(td01);

   let td02 = document.createElement('td');
   td02.innerHTML = contents.value;
   tr.appendChild(td02);

   document.getElementById('r_listBody').appendChild(tr);
   contents.value = '';
   contents.focus();
}

// 객실 전체 삭제
function r_delAllEle() {

   // 선택한 숙소의 pension_seq 를 주세요.
   $.ajax({

      url: 'roomAllDelete.do',
      type: 'post',
      data: {
         'pension_seq': pension_seq
      },
      success: function (res) {
         // res : pension_seq
         console.log(res)
         showRoom(res)
      },
      error: function () {
         alert('객실 전체 삭제 실패!')
      }
   });


   let list = document.getElementById('r_listBody');
   let listChild = list.children;
   for (let i = 0; i < listChild.length; i++) {
      list.removeChild(listChild[i])
      i--;
   }
}




// 객실선택 수정
function r_btnUpdate() {

   // 선택한 객실의 room_seq, pension_seq와 
   // 수정할 room_name 주세요!
   $.ajax({
      url: 'roomUpdate.do',
      type: 'post',
      data: {
         'room_seq': room_seq,
         'pension_seq': pension_seq,
         'room_name': room_name
      },
      success: function (res) {
         // res : pension_seq;
         showRoom(res);
      },
      error: function () {
         alert('error')
      }
   });
   let list = document.getElementById('r_listBody');
   Array.from(list.children).forEach(trItem => {
      if (trItem.querySelector('input').checked) {
         let textNode = trItem.childNodes[1];
         let text = textNode.innerTexjt;
         trItem.removeChild(textNode);
         let input = document.createElement('input');
         input.value = text;
         trItem.appendChild(input);
      }
   })

   let updatebtn = document.createElement('Button');
}



// 객실 선택 삭제
function r_delSelected() {

   // 선택된 객실의 숙소 pension_seq 주세요.
   $.ajax({
		url: 'roomAllDelete.do',
		type: 'post',
		data: {
			'pension_seq': pension_seq
		},
		success: function (res) {
         // res : pension_seq
			alert(res)
			showRoom(res.pension_seq)
		},
		error: function () {
			alert('error')
		}
	});


   let body = document.getElementById('r_listBody');
   let chkbox = document.querySelectorAll('#r_listBody .r_btn-chk');
   for (let i in chkbox) {
      if (chkbox[i].nodeType == 1 && chkbox[i].checked == true) {   // 체크확인      
         body.removeChild(chkbox[i].parentNode.parentNode);
      }
   }
}



///끝
////////////////////// 에디꺼 >< ///////////////////////////////////



$.noConflict();

jQuery(document).ready(function ($) {

   "use strict";

   [].slice.call(document.querySelectorAll('select.cs-select')).forEach(function (el) {
      new SelectFx(el);
   });

   jQuery('.selectpicker').selectpicker;




   $('.search-trigger').on('click', function (event) {
      event.preventDefault();
      event.stopPropagation();
      $('.search-trigger').parent('.header-left').addClass('open');
   });

   $('.search-close').on('click', function (event) {
      event.preventDefault();
      event.stopPropagation();
      $('.search-trigger').parent('.header-left').removeClass('open');
   });

   $('.equal-height').matchHeight({
      property: 'max-height'
   });

   // var chartsheight = $('.flotRealtime2').height();
   // $('.traffic-chart').css('height', chartsheight-122);


   // Counter Number
   $('.count').each(function () {
      $(this).prop('Counter', 0).animate({
         Counter: $(this).text()
      }, {
         duration: 3000,
         easing: 'swing',
         step: function (now) {
            $(this).text(Math.ceil(now));
         }
      });
   });




   // Menu Trigger
   $('#menuToggle').on('click', function (event) {
      var windowWidth = $(window).width();
      if (windowWidth < 1010) {
         $('body').removeClass('open');
         if (windowWidth < 760) {
            $('#left-panel').slideToggle();
         } else {
            $('#left-panel').toggleClass('open-menu');
         }
      } else {
         $('body').toggleClass('open');
         $('#left-panel').removeClass('open-menu');
      }

   });


   $(".menu-item-has-children.dropdown").each(function () {
      $(this).on('click', function () {
         var $temp_text = $(this).children('.dropdown-toggle').html();
         $(this).children('.sub-menu').prepend('<li class="subtitle">' + $temp_text + '</li>');
      });
   });


   // Load Resize 
   $(window).on("load resize", function (event) {
      var windowWidth = $(window).width();
      if (windowWidth < 1010) {
         $('body').addClass('small-device');
      } else {
         $('body').removeClass('small-device');
      }

   });


});