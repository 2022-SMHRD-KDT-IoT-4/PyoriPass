document.getElementById('r_btnDelAll').addEventListener('click', r_delAllEle);   // 전체삭제
document.getElementById('r_DeleteSel').addEventListener('click', r_delSelected);   // 선택 삭제 
document.getElementById('r_btnUpdate').addEventListener('click', r_btnUpdate);   // 선택 수정


let listBox = document.getElementById('list-box');
let r_listBox = document.getElementById('r_list-box');
let host_id = $('#host_id').val();
//let reservation_num = $('#reservation_num').val();
//console.log("이이이이이이이거 보셈" + reservation_num);

//let host_id = document.querySelector(".host_id");
console.log(host_id);
let list = "";



/////////// Rentals_information


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
         console.log("loadBoard res : " + JSON.stringify(res));
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

   console.log(res);

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
      	 $('#r_num').html("");
         let pension_seq = res[i].pension_seq;
         let input02 = document.createElement('input');
         input02.setAttribute('type', 'hidden');
         input02.setAttribute('value', res[i].pension_seq);
         input02.setAttribute('id', 'r_pension_seq');
         $("#r_num").append(input02);
         

         showRoom(res);
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
         
         //$('#btnUpdate').setAttribute('id', 'updatebtn');
         
         let updatebtn = document.createElement('button');
         updatebtn.setAttribute('id', 'updatebtn');
         let updatebtn_content = document.createTextNode('수정완료');
         updatebtn.appendChild(updatebtn_content);
         trItem.appendChild(updatebtn)
         

         
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
function showRoom(res) {
   
   let contents = document.querySelector('.r_text-basic');

   let pension_seq = $('#r_pension_seq').val();
   
   console.log("showRoom 진입")
   // 선택한 숙소의 pension_seq 주세요
   $.ajax({
      url: 'roomList.do',
      type: 'post',
      data: {
         'pension_seq': pension_seq
      },
      success: function (res) {
         $('#r_listBody').html("");
         
         if (r_listBox.style.display == 'none') {
            r_listBox.style.display = 'block';
            
            
            // function showRoom(pension_seq) {
               // 선택한 숙소의 pension_seq 주세요
               //}
            }
            else {
               r_listBox.style.display = 'none';
            }
            for (let i = 0; i < res.length; i++) {
               let tr = document.createElement('tr');
               let input = document.createElement('input');
               input.setAttribute('type', 'checkbox');
               input.setAttribute('class', 'r_btn-chk');
               input.setAttribute('value', res[i].room_seq);
               
               let td01 = document.createElement('td');
               td01.appendChild(input);
            tr.appendChild(td01);
            
            let td02 = document.createElement('td');
            td02.innerHTML = res[i].room_name;

            tr.appendChild(td02);
            
            document.getElementById('r_listBody').appendChild(tr);
            contents.value = '';
            contents.focus();
         }
         //res : List형태로 나와요(room_seq,pension_seq,room_name)
         //console.log(res)
         
      },
      error: function () {
         alert('객실 조회 에러!')
      }
   });
}


//객실 추가하기
function r_addList() {
   
   let room_name = $('.r_text-basic').val();
   let pension_seq = $('#r_pension_seq').val();
   let contents = document.querySelector('.r_text-basic'); 
   
   console.log(room_name);
   console.log(pension_seq);
   console.log(contents);
   
   if (!contents.value) {
      alert('추가할 객실을 입력해주세요.');
      contents.focus();
      return false;
   }
   
   // 객실 추가 기능
   // 선택한 숙소의 pension_seq와 추가할 객실의 이름 room_name 주세요.
   $.ajax({
      url: 'roomInsert.do',
      type: 'post',
      data: {
         'pension_seq': pension_seq,
         'room_name': room_name
      },
      success: function (res) {
         // res : pension_seq
         //showRoom(res)
         let tr = document.createElement('tr');
         let input = document.createElement('input');
         input.setAttribute('type', 'checkbox');
         input.setAttribute('class', 'r_btn-chk');
         input.setAttribute('value', "");

         let td01 = document.createElement('td');
         td01.appendChild(input);
         tr.appendChild(td01);
         
         let td02 = document.createElement('td');
         td02.innerHTML = room_name;
         tr.appendChild(td02);
         

         document.getElementById('r_listBody').appendChild(tr);
         contents.value = '';
         contents.focus();
      },
      error: function () {
         alert('객실 추가 실패!')
      }
   });
   
}

// 객실 전체 삭제
function r_delAllEle() {

   let pension_seq = $('#r_pension_seq').val();
   
   // 선택한 숙소의 pension_seq 를 주세요.
   $.ajax({

      url: 'roomAllDelete.do',
      type: 'post',
      data: {
         'pension_seq': pension_seq
      },
      success: function (res) {
         let list = document.getElementById('r_listBody');
         let listChild = list.children;
         for (let i = 0; i < listChild.length; i++) {
            list.removeChild(listChild[i])
            i--;
         }
         // res : pension_seq
         console.log(res)
         showRoom(res)
      },
      error: function () {
         alert('객실 전체 삭제 실패!')
      }
   });
   
   
}



// 객실선택 수정
function r_btnUpdate() {
   

   // 선택한 객실의 room_seq, pension_seq와 
   // 수정할 room_name 주세요!
   let list = document.getElementById('r_listBody');
   Array.from(list.children).forEach(trItem => {
      if (trItem.querySelector('input').checked) {
         let textNode = trItem.childNodes[1];
         let text = textNode.innerText;
         trItem.removeChild(textNode);
         let input = document.createElement('input');
         input.value = text;
         trItem.appendChild(input);
         
         let updatebtn = document.createElement('Button');
         updatebtn.setAttribute('id', 'updatebtn');
         let updatebtn_content = document.createTextNode('수정완료');
         updatebtn.appendChild(updatebtn_content);
         trItem.appendChild(updatebtn)
         
         updatebtn.onclick = () => {

            let room_seq = trItem.childNodes[0].childNodes[0].value;
            let room_name = input.value;
            let pension_seq = $('#r_pension_seq').val();

            

            $.ajax({
               url: 'roomUpdate.do',
               type: 'post',
               data: {
                  'room_seq': room_seq,
                  'pension_seq': pension_seq,
                  'room_name': room_name
               },
               success: function (res) {
                  //console.log(res);
                  // res : pension_seq;
                  showRoom(res);
                  
               },
               error: function () {
                  alert('error')
               }
            });
         }
      }
   });
}




// 객실 선택 삭제
function r_delSelected() {
   
   let body = document.getElementById('r_listBody');
   let chkbox = document.querySelectorAll('#r_listBody .r_btn-chk');
   
   for (let i in chkbox) {
      if (chkbox[i].nodeType == 1 && chkbox[i].checked == true) {
         let room_seq = chkbox[i].value;
         //console.log(pension_seq);
         // 선택된 객실의 숙소 pension_seq 주세요.
         $.ajax({
            url: 'roomDelete.do',
            type: 'post',
            data: {
               'room_seq': room_seq
            },
            success: function (res) {
               showRoom(res.pension_seq);
            },
            error: function () {
               alert('error')
            }
         });

         
         body.removeChild(chkbox[i].parentNode.parentNode);
      }
   }
}



///끝

///////////////////////////Guest_Reservation//////////////


// db에 들어있는 숙소 select로 띄우기
//document.getElementById('guest_reservation_pname').addEventListener('click', selectP);   // 선택 수정
function selectP(host_id){
   $.ajax({
      url: 'pensionselect.do',
      type: 'get',
      data: {
         'host_id': host_id
      },
      success: function (res) {
         console.log(res);
         console.log("selectP res : "+res[0].pension_name);
      	$('#guest_reservation_pname').html("");
		for(let i =0; i<res.length; i++){
			pensionList = res[i]
			tr= `
				<option value='${pensionList.pension_seq}'>${pensionList.pension_name}</option>
            `;
				//<option value 'i'>${pensionList.pension_name}</option>
			$('#guest_reservation_pname').append(tr);

		}

      //console.log("이거보셈 : "+res[0].pension_seq);
      //alert(pension_seq);
      //selectR(pension_seq);
      },
      error: function () {
         alert('error')
      }
   })
}
function selectR(name){
   console.log(name);
   $.ajax({
      url: 'roomselect.do',
      type: 'get',
      data: {
         'pension_seq': name
      },
      success: function (res) {
         console.log(res);
         $('#guest_reservation_rname').html("");
         for(let i=0; i<res.length; i++){
            roomlist = res[i];
            tr = `
               <option>${roomlist.room_name}</option>
            `;
            $('#guest_reservation_rname').append(tr)
         }
		},
      error: function () {
         alert('error')
      }
   })

}
//db에 들어있는 객실 select로 띄우기

//펜션seq를 가져와야댐. (pension_seq 받아서 roomname띄우고 room_Seq를 보냄)
// function selectR(res){
  
//    //let pension_seq = $('#r_pension_seq').val();
//    //console.log("이거보셈" + pension_seq);
//    console.log("이거 보셈 : " + res[0].pension_seq);
   
      
      
//       $.ajax({
//      url: 'roomselect.do',
//      type:'get',
//      data: {
//         'pension_seq': pension_seq
//       },
//       success : function(res){
      
//          $('#guest_reservation_rname').html("");
//          list= `
// 				<option>${pensionlist.pension_seq}</option>
// 			`;
          
//             $('#guest_reservation_rname').append(list);
         
//       }, error : function() {
//          alert('숙소error')
//       }
//    })

// }


// 게스트 입력 정보 등록 클릭시 저장 

//function addGuest() {
//let send = document.getElementById("guest_reservation_ok");
//	send.addEventListener("click", function () {
//  	let name = document.getElementById("guest_reservation_personname");
//  	let num = document.getElementById("guest_reservation_rnum");
//  	let tel = document.getElementById("guest_reservation_pnum");
// 	let pension = document.getElementById("guest_reservation_pname");
//  	let room = document.getElementById("guest_reservation_rname");
//  	let checkin = document.getElementById("guest_reservation_checkin");
//  	let checkout = document.getElementById("guest_reservation_checkout");


//	if(name.value == "") {
//		alert ("이름을 입력해주세요.");
//		name.focus();
//		return;
//		}
		
//	if(num.value == "") {
//		alert ("예약번호를 입력해주세요.");
//		num.focus();
//		return;
//		}
		
//	if(tel.value == "") {
//		alert ("전화 번호를 입력해주세요.");
//		tel.focus();
//		return;
//		}
		
//	if(checkin.value == "") {
//		alert("체크인 날짜를 선택해주세요");
//		checkin.focus();
//		return;
//		}
		
//	if(checkout.value == "") {
//		alert("체크아웃 날짜를 선택해주세요");
//		checkout.focus();
//		return;
//		}

//   $.ajax({
//      url : 'insertGuestReservation.do',
//      type : 'post',
//      data : {
//         'guest_name' : name.value,
//         'reservation_num' : num.value,
//         'guest_phone' : tel.value,
//         'checkin_date' : checkin.value,
//         'checkout_date' : checkout.value
//      },
//      success : function(){
//      	console.log("등록성공");
//      		

//      },error : function() {
//         alert('게스트 등록 error');
//      }
//   })
//  }
//)
//}




// $('#guest_reservation_pname').on("select", function() {
// 	if ($(this).val().trim().length == 0) {
//         $("same2").text("");
//         return;
//     }

    
// });


// // 숙소 이름 선택시 값 가져오기 
// $(document).ready(function(){
//    $('#guest_reservation_pnam').change(function(){
//       console.log('숙소이름 값' + $(this).val());
//    })
// })







////////////////////// 에디꺼 >< ///////////////////////////////////


