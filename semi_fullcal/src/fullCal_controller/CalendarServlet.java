package fullCal_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fullCal_dao.CalendarDao;
import fullCal_dto.CalendarDto;
import net.sf.json.JSONObject;

@WebServlet("/cal.do")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		
		if(command.equals("test")) {
			System.out.println("서블릿 입성");
			int res = 0;
			
			String dateSta = request.getParameter("dateSta");
			String dateEnd = request.getParameter("dateEnd");
			
			//System.out.println(request.getParameter("dateSta"));
			//System.out.println(request.getParameter("dateEnd"));
			
			
			CalendarDto dto = new CalendarDto("돈독", "이다희조장", dateSta, dateEnd);
			CalendarDao dao = new CalendarDao();
			res = dao.insert(dto);
			
			System.out.println(res);

		} else if(command.equals("select")) {


			System.out.println("서블릿 입성");
			CalendarDto dto = new CalendarDto();
			CalendarDao dao = new CalendarDao();
			
			List<CalendarDto> callist = dao.select(dto);
			
			for(int i=0; i < callist.size(); i++) {
				System.out.println("시작점 : " + callist.get(i).getStartdate());
				System.out.println("끝점 : " + callist.get(i).getEnddate());
			}
			
			
		
	        Map<String, List<CalendarDto>> map = new HashMap<String, List<CalendarDto>>();
	        map.put("callist", callist);
			
	       /* for(Map.Entry<String, List<CalendarDto>> entry : map.entrySet()) {
	        	System.out.println("시작 : " + entry.getKey() + " 마지막 : " + entry.getValue());
	        	
	        }*/
	        
			JSONObject obj = JSONObject.fromObject(map);
			PrintWriter out = response.getWriter();
			
			obj.write(out);
			
		}
	}
}
