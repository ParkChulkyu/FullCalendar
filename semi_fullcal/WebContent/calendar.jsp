<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
<link href='fullcalendar/core/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='fullcalendar/timegrid/main.min.css' rel='stylesheet' />

<script src='fullcalendar/core/main.js'></script>
<script src='fullcalendar/daygrid/main.js'></script>
<script src='fullcalendar/interaction/main.js'></script>
<script src='fullcalendar/timegrid/main.js'></script>
<script src="fullcalendar/moment/main.min.js"></script>
<script src="fullcalendar/google-calendar/main.js"></script>
<script src='fullcalendar/core/locales/ko.js'></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>


document.addEventListener('DOMContentLoaded', function() {
	var Calendar = FullCalendar.Calendar;
	var Draggable = FullCalendarInteraction.Draggable;
	
	var containerEl = document.getElementById('external-events');
	var calendarEl = document.getElementById('calendar');
	var checkbox = document.getElementById('drop-remove');

	var dateArray = new Array();
	var calendar = new FullCalendar.Calendar(calendarEl, {
		// plugins: 모듈 js파일들을 사용한다.
		plugins : [ 'dayGrid', 'interaction', 'timeGrid', 'moment' ],

		// 머릿말엔 이전, 센터, 오른쪽으로 되어있다.
		header : {
	        left: 'addEventButton, dayGridMonth,timeGridWeek,timeGridDay',
	        center: 'title',
	        right: 'prev,next today'
		},
 		
		// 일정 등록하는 방법
		customButtons : {
			addEventButton : {
				text : '일정등록',
				click : function(info) {
					var dateSta = prompt('시작날짜를 입력해주세요.(예). 2020-01-01)');
					var dateEnd = prompt('마지막날짜를 입력해주세요.(예). 2020-01-01)');
					var date = new Date(dateSta); // will be in local time
					var date2 = new Date(dateEnd);
					if(dateSta > dateEnd){
						alert('마지막 날짜가 시작 날짜전 날짜로 선택 될수 없습니다.');
						return false;
					}
					if (!isNaN(date.valueOf()) && !isNaN(date2.valueOf())) { // valid?
						calendar.addEvent({
							/* 
							- title : 캘린더에 표시되는 일정의 이름
							- start : 캘린더에 표시되는 일정의 시작일 (yyyy-mm-dd[THH:MM:SS] ; 2019-09-05T12:30:00)
							- end : 캘린더에 표시되는 일정의 마지막 일 (yyyy-mm-dd[THH:MM:SS] ; 2019-09-05T12:30:00)
							- 캘린더에는 start부터 end전날까지 표시됨
							- allDay : 일정이 종일인지 아닌지 여부(boolean)*/
							
							title : '사용자가 입력한 날짜',
							start : date,
							end : date2
							
							//allDay : true
						});
						alert('해당 날짜의 데이터가 달력에 저장됐다.');
					} else {
						alert('실용가능하지않다.');
					}
					// 내가 등록한 날짜 볼수있음
					console.log(dateSta);
					console.log(dateEnd);
					//document.getElementById('day').value = dateStr;
					
					// ajax 해보기
				    $.ajax({
				        url:'cal.do?command=test&dateSta='+dateSta+'&dateEnd='+dateEnd,
				        type:'post',
				        async: false,
				        data:'String',
				        success:function(){
				            console.log('통신성공');
				        },
				        error:function(){
				            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
				        }
				    });
				}
			}
		},
		buttonText : {
			today : '오늘'
		},
		
	
		// 기본값 달력이다.
		defaultView : 'dayGridMonth',

		// 달력화면 일자를 다중으로 선택할수있음: true
		selectable : true,

		// 시간대를 설정가능 (GMT: 한국, UTC: 협정 세계시)
		timeZone : 'Asia/Seoul',

		// 일정들을 수정(길이가 길어질수도있고 다음달로 이월가능하다.)할수있다.
		editable : false,

		//
		navLinks : true, // can click day/week names to navigate views
	    
		// 달력에 한국어 표기하는법
		locale : 'ko',

		// 
	    select: function(info) {
	        alert('시작 ' + info.startStr + ' 끝점 ' + info.endStr);
	    },
	    events : function(dateSta, dateEnd) {
				$.ajax({
					url : "cal.do?command=select",
					dataType : "json",
					type:'post',
					success : function(data) {
						
						console.log(data.callist);
						
						var callist = new Array();
						
						for(var i; i<data.callist.length; i++){
							callist[i] = data.callist[i];
							console.log(callist[i]);
						}
						alert("success");

					},
					error : function(request, status, error) {
						if (request.status != '0') {
							alert("code : " + request.status + "\nmessage : "
									+ request.reponseText + "\nerror : "
									+ error);
						}
					}
				});

			}//events

		});

		// 달력화면을 표시한다.
		calendar.render();

	});
</script>



<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar-container {
	position: relative;
	z-index: 1;
	margin-left: 200px;
}

#calendar {
	max-width: 900px;
	margin: 20px auto;
}

.fc-sun {
	color: red !important;
}

.fc-sat {
	color: blue !important;
}
</style>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>

