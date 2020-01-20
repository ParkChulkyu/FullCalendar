<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='fullcalendar/core/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />

<script src='fullcalendar/core/main.js'></script>
<script src='fullcalendar/daygrid/main.js'></script>
<script src='fullcalendar/interaction/main.js'></script>
<script src='fullcalendar/timegrid/main.js'></script>
<script>

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			// plugins: 모듈 js파일들을 사용한다.
			plugins : [ 'dayGrid', 'interaction', 'timegrid', 'moment', 'moment-timezone' ],
			
			// 머릿말엔 이전, 센터, 오른쪽으로 되어있다.
			header : {
				left : 'addEventButton',
				center : 'title',
				right : 'prev,next today'
				
			},
			
			// 일정 등록하는 방법
		    customButtons: {
		        addEventButton: {
		          text: '일정등록',
		          click: function(info) {
		            var dateStr = prompt('일정을 YYYY-MM-DD 형식으로 추가해라');
		            // var dateStr2 = prompt('일정을 YYYY-MM-DD 형식으로 추가해라');
		            var date = new Date(dateStr + 'T00:00:00'); // will be in local time
		            // var date2 = new Date(dateStr2 + 'T00:00:00');

		           
		            
		            if (!isNaN(date.valueOf())) { // valid?
		              calendar.addEvent({
		                title: '일정 등록시 제목',
		                start: date, //date2,
		                allDay: true
		              });
		              alert('해당 날짜의 데이터가 달력에 저장됐다.');
		            } else {
		              alert('실용가능하지않다.');
		            }
		            // 내가 등록한 날짜 볼수있음
		            console.log(dateStr);
		            document.getElementById('day').value = dateStr;
		          }
		        }
		      },
			buttonText: {
				today: '오늘'
			},
			// 기본값 달력이다.
			defaultView : 'dayGridMonth',
			
			// 달력화면 일자를 다중으로 선택할수있음: true
			selectable : true,
			
			// 시간대를 설정가능 (GMT: 한국, UTC: 협정 세계시)
			timeZone: 'GMT',
			
			// 일정들을 수정(길이가 길어질수도있고 다음달로 이월가능하다.)할수있다.
			editable: true,
			
			//
			navLinks: true, // can click day/week names to navigate views
			
			// 달력에 한국어 표기하는법
			locale : 'ko',
			
			// 이벤트라주고 일정이 등록되어있는 것을 보여줌
			events : [{ // this object will be "parsed" into an Event Object
				title : '신정', // a property!
				url : 'cal.do?command=test',
				start : '2020-01-01', // a property!
				end : '2020-01-01', // a property! ** see important note below about 'end' **
				textColor:'red'
			}],
			

			
			// 날짜를 클릭했을 때, 어느 날짜인지 알려주는 함수
		/*	dateClick : function(info) {
				//alert('Clicked on: ' + info.dateStr);
				//alert('Coordinates: ' + info.jsEvent.pageX + ','
				//		+ info.jsEvent.pageY);
				//alert('Current view: ' + info.view.type);
				// change the day's background color just for fun
				info.dayEl.style.backgroundColor = 'red';
				console.log(info.dateStr);
			}*/
		});
	
		// 달력화면을 표시한다.
		calendar.render();
	});
</script>



<style type="text/css">
    body {
        margin: 40px 10px;
        padding: 0;
        font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
        font-size: 14px;
    }

    #calendar {
        max-width: 900px;
        margin: 0 auto;
    }
	.fc-sun {
		color: red !important;
	}

	.fc-sat{
		color: blue !important;
	}
    
</style>
</head>
<body>


<div id='calendar'></div>
<input type="text" name="day" id="day" >
 
</body>
</html>

