package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;

import javax.naming.NamingException;

import util.ConnectionPool;

public class JoinDAO {

	
	// gymdetail.jsp(resume)
	public boolean resumeinsert(String user_from_no, String user_to_no)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					String sql = "INSERT INTO resume VALUES (?,?)";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, user_from_no);
						pstmt.setString(2, user_to_no);
					int result = pstmt.executeUpdate();
					
					return (result==1) ? true : false;			
					
				} finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	
			/*	join> gym_no/trainer_no
			 * SELECT gym_no, trainer_no FROM gym AS g INNER JOIN trainer AS t ON g.user_no
			 * = t.user_no;
			 */
}
