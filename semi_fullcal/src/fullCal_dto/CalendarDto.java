package fullCal_dto;

public class CalendarDto {

	// 유저 아이디
	private String id;
	
	// 일정 이름
	private String title;
	
	// 일정 시작 날짜
	private String startdate;
	
	// 일정 끝나는 날짜
	private String enddate;
	
	// 해당 일정에 대한 색
	private String color;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

}
