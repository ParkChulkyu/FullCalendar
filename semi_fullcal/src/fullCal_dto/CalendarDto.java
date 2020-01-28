package fullCal_dto;

import java.util.Date;

public class CalendarDto {

	// 유저 아이디
	private String t_id;
	
	// 일정 이름
	private String u_id;
	
	// 일정 시작 날짜
	private String startdate;
	
	// 일정 끝나는 날짜
	private String enddate;

	public CalendarDto() {}

	public CalendarDto(String t_id, String u_id, String startdate, String enddate) {
		super();
		this.t_id = t_id;
		this.u_id = u_id;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
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
