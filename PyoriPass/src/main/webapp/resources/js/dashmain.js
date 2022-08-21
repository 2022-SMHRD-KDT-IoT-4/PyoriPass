



let host_id2 = document.querySelector(".host_id").value;
console.log(host_id2);


// 오늘 예약 정보 조회 

function today() {
	$.ajax({
		url: 'todaybooking.do',
		type: 'post',
		data: {
			'host_id': host_id2
		},
		success: function (data) {
			//$('#b_today').html("");
			$('#b_today_id').append(data.guest_name);
			$('#b_today_date').append(data.checkin_date.split(' ')[0] +'~'+ data.checkout_date.split(' ')[0]);
			$('#b_today_nfc').append(data.guest_nfc == null ? 'NFC미발급' : 'NFC발급');
			
		}
	})
}

function tomorrow() {
	$.ajax({
		url: 'nextbooking.do',
		type: 'post',
		data: {
			'host_id': host_id2
		},
		success: function (res) {
			$('#b_tomorrow_id').append(res.guest_name);
			$('#b_tomorrow_date').append(res.checkin_date.split(' ')[0] + '~' + res.checkout_date.split(' ')[0]);
			$('#b_tomorrow_nfc').append(res.guest_nfc == null ? 'NFC미발급' : 'NFC발급');
		}
	})
}






// 리스트 띄우기

function loadList() {
	$.ajax({
		url: 'listselect',
		type: 'post',
		data: {
			'host_id': host_id2
		},
		success: function (data) {
			$('#dash_tbody').html("");
			for (let i = 0; i < 4; i++) {
				board = data[i]
				tr = `
	      		<tr>
	      		<input type="hidden" value = "${board.reservation_num}" id="res-num${board.reservation_num}">
	      		<td>${board.guest_name}</td>
	      		<td>${board.pension_name}</td>
	      		<td>${board.checkin_date}</td>
	      		<td>${board.checkout_date}</td>
	      		<td>${board.room_name}</td>
	      		<td>${board.guest_nfc == null ? "<button id = notissuebtn>Before issuance</button>" : "<button id =issuebtn>issue</button>"}</td>
	      		// null ? "true" : "false"
	      		</tr>
	      	`

				$('#dash_tbody').append(tr);
			}
		},
		error: function () {
			alert('error')
		}
	});


}







// 캘린더
function loadcalendar() {

	data1 = $.ajax({
		url: 'calendarselect',
		type: 'post',
		dataType: 'json',
		data: { 'host_id': host_id2 },
	});

	let jsonArray = new Array();

	data1.done(function (data) {
		$.each(data, function (index, res) {
			let json = new Object();

			json.reservationNum = res.reservation_num;
			json.title = res.guest_name;
			json.start = res.checkin_date;
			json.end = res.checkout_date;
			json.color = "#9b938a";
			json.textColor = "#000000"
			jsonArray.push(json);
		});

		let calendarEl = document.getElementById('calendar');
		let a = jsonArray;


		let calendar = new FullCalendar.Calendar(
			calendarEl,
			{
				googleCalendarApiKey: 'AIzaSyCbdZ0le62pyErl1Mc4rnZ77q48LMPaLt0',
				eventSources: [{
					googleCalendarId: 'https://calendar.google.com/calendar/u/0?cid=cXZ1ajYyZ3J0NTY4cTB1NGpsMjlib2VkNTRAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ',
					className: '일정확인',
					color: '#2A5415',
				}],
				events: a,
				eventClick : evt => calendar_info_view(evt.event.extendedProps.reservationNum)

			});



		// 메모장


		calendar.render();
	})
};



// 캘린더 옆

// 내용 보여주기
function calendar_info_view(reservationNum) {
	console.log(reservationNum);
	$.ajax({
		url: 'calendardetail',
			type: 'post',
	      	data : {'reservation_num' : reservationNum 
	      	},
			success: function(res) {
				console.log(res);
			$('#calendar_content').html("");
				tr = `
				<tr>
				<div id = "calnedar_c">
				<td id = "calendar_name_img_container"><img id="calendar_name_img" src="resources/img/호스트 정보.png">     ${res.guest_name}    </td>
				</tr>
				<tr>
				<td id = "calendar_pn">  숙소명    ${res.pension_name}</td>
				</tr>
				<tr>
				<td id = "calendar_gp">  전화번호    ${res.guest_phone}</td>
				</tr>
				<tr>
				<td id = "calendar_rn">  객실    ${res.room_name}</td>
				</tr>
				<tr>
				<td id = "calendar_date">  입퇴실시간    ${res.checkin_date.split(' ')[0]}  -  ${res.checkout_date.split(' ')[0]}</td>
				</tr>
				<tr>
				</div>
				<td><input type = "button" id = "calendar_info_btn" value = "수정"></td>
				</tr>
			`


			$('#calendar_content').append(tr);
			}
		});

	}







// 수정하기 버튼 클릭시 
function calendar_info_Update() {

	let update_doneBtn = "<button class ='update_success btn' onclick='update(\"" + + "\")'>수정</button>"
	let update_cancleBtn = "<button class ='update_cancle btn' onclick='calendar_info_view'>취소</button>"
	let update_deleteBtn = "<button class ='update_delete btn' onclick=''>삭제</button>"
}


// 수정완료 후 (수정하기 버튼 > 수정)

function update() {
	$.ajax({
		url: "",
		type: "post",
		data: {

		},
		success: loadcalendar,
		error: function () {
			alert("error");
		}
	})
}


// 마이페이지

