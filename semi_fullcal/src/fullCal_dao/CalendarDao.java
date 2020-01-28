package fullCal_dao;



import org.apache.ibatis.session.SqlSession;

import java.util.List;

import fullCal_db.SqlMapConfig;
import fullCal_dto.CalendarDto;


public class CalendarDao extends SqlMapConfig {
	
	private String namespace = "fullCalMapper.";
	
	public int insert(CalendarDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			res = session.insert(namespace+"insert", dto);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return res;
	}
	
	public List<CalendarDto> select(CalendarDto dto) {
		
		SqlSession session = null;
		List<CalendarDto> calList = null;		
		try {
			session = getSqlSessionFactory().openSession();
			calList = session.selectList(namespace+"select", dto);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return calList;
	}
}
