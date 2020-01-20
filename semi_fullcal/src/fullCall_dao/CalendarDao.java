package fullCall_dao;

import static fullCal_db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import fullCal_dto.CalendarDto;


public class CalendarDao {
	
	public int insert(CalendarDto dto) {
		Connection con =getConnection();
		int res = 0;
		String sql = " INSERT INTO CREATECAL VALUES ('김동주', '부산여행', ?, ?, 'red') ";
		PreparedStatement pstm = null;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getStartdate());
			pstm.setString(2, dto.getEnddate());
			
			res = pstm.executeUpdate();
			
			if(res > 0) {
				con.commit();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
	
		return res;
	}
}
