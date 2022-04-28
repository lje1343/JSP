package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class JoinDAO {

	
	// gymdetail.jsp (이력서제출 버튼 클릭시)
	public boolean resumeinsert(String user_from_no, String user_to_no)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				int chk = duplicateCheck(user_from_no, user_to_no);
				
				if(chk == 0) {
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
				} else {
					return false;
				}
			}


	// gymdetail.jsp (이력서제출 카운트) 
	public String resumeCount(String gym_no) throws NamingException, SQLException, Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String count = "";
		
		try {
			String sql = "SELECT COUNT(*) as count FROM resume WHERE user_to_no = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, gym_no);
			rs = pstmt.executeQuery();
			
			rs.next(); 
			count = rs.getString("count");
			
			return count;
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close(); 
		}
	}

	//gymdetail.jsp (이력서제출 중복검사)
	public int duplicateCheck(String user_from_no, String user_to_no) throws NamingException, SQLException {
			
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT user_from_no FROM resume WHERE user_to_no = ?";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, user_to_no);
					rs = pstmt.executeQuery();
					
					ArrayList<String> ufn = new ArrayList<String>();
					
					while(rs.next()) {
						ufn.add(rs.getString("user_from_no"));
					}
					
					if (ufn.contains(user_from_no)) {
						return 1;						
					}else {
						return 0;
					}	
				}
				finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
		
	}
	
}
