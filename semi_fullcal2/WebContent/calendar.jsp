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
			// dateClick: 해당 날짜를 클릭했을때 뜨는 이벤트
			dateClick: function() {
			 //   alert('선택하였습니다.');  
			},

			// plugins:js파일들을 사용한다.
			plugins : [ 'dayGrid', 'interaction', 'timegrid' ],
			
			// 머릿말엔 이전, 센터, 오른쪽으로 되어있다.
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			buttonText: {
				today: '오늘',
				month: '일정 추가하기'
			},
			defaultView : 'dayGridMonth',
			selectable : true,
			
			// 달력에 한국어 표기하는법
			locale : 'ko',
			
			// 이벤트라주고 일정이 등록되어있는 것을 보여줌
			events : [{ // this object will be "parsed" into an Event Object
				title : '신정', // a property!
				url : 'http://www.naver.com/',
				start : '2020-01-01', // a property!
				end : '2020-01-01' // a property! ** see important note below about 'end' **
				
			}],
			
			// 기록된 일정에 세부내용을 확인 하고 싶으면 클릭하는 이벤트
			eventClick:function(event) {
                if(events.url) {
                    alert(events.title + "\n" + events.url, "wicked", "width=700,height=600");
                    window.open(events.url);
                    return false;
                }
            }
			
		});
		

		// 날짜를 클릭했을 때, 어느 날짜인지 알려주는 함수
		calendar.on('dateClick', function(info) {
			 console.log('클릭한 날짜 ' + info.dateStr);
			/*if(info.datestr != 0){
				//alert("핳하하하");
				$.ajax({
					url: 'http://www.naver.com/',
				});
			}*/
		});
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
 
</body>
</html>

