package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.naming.NamingException;

import jdbc.TrainerDTO;
import jdbc.UserDTO;
import util.ConnectionPool;

public class TrainerDAO {
	
	public TrainerDTO getTrainer(String user_no)
			   throws NamingException, SQLException {

			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;

			      try {
			         TrainerDTO trainer = null;
			         UserDTO user = new UserDAO().getUser(user_no);

			         String sql = "SELECT * FROM trainer WHERE user_no = ?";

			         conn = ConnectionPool.get();
			         pstmt = conn.prepareStatement(sql);
			         pstmt.setString(1, user_no);
			         rs = pstmt.executeQuery();
			         rs.next();

			         trainer = new TrainerDTO(user.getUser_no(),
			                           user.getUser_name(),
			                           user.getUser_pw(),
			                           user.getUser_birth(),
			                           user.getUser_zipcode(),
			                           user.getUser_addr(),
			                           user.getUser_addrdetail(),
			                           user.getUser_gender(),
			                           user.getUser_email(),
			                           user.getUser_phone(),
			                           user.getUser_admin(),
			                           user.getUser_kakao(),
			                           user.getUser_auth(),
			                           user.getUser_status(),
			                           rs.getString("trainer_no"),
			                           rs.getString("trainer_title"),
			                           rs.getString("trainer_content"),
			                           rs.getString("trainer_secret"),
			                           rs.getString("trainer_addr"),
			                           rs.getString("trainer_regdate"),
			                           rs.getString("trainer_images"));

			         return trainer;
			      } finally {
			         if (rs != null)
			            rs.close();
			         if (pstmt != null)
			            pstmt.close();
			         if (conn != null)
			            conn.close();
			      }
			   }
	
	
	// trainerwrite.jsp (IMAGES -> X)
		public boolean trainerInsert(String gym_name, String gym_content, String gym_addr, String gym_salary)
				throws NamingException, SQLException {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				String sql = "INSERT INTO gym VALUES (NULL,?,?,?,?,?,?,?,NULL)";
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, 2);
				pstmt.setString(2, gym_name);
				pstmt.setString(3, gym_content);
				pstmt.setString(4, gym_addr);
				pstmt.setString(5, gym_salary);
				pstmt.setInt(6, 0);
				pstmt.setString(7, LocalDateTime.now().toString());
				int result = pstmt.executeUpdate();
				
				return (result==1) ? true : false;			
				
			} finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		
		// trainerwrite.jsp (IMAGES -> O)
		public boolean trainerInsert(String gym_name, String gym_content, String gym_addr, String gym_salary, ArrayList<String> arr)
		throws NamingException, SQLException {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String gym_images = "";
			
			for(String i : arr) {
				gym_images += i + "/";
			}
			
			
			try {
				String sql = "INSERT INTO gym VALUES (NULL,?,?,?,?,?,?,?,?)";
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, 8);
					pstmt.setString(2, gym_name);
					pstmt.setString(3, gym_content);
					pstmt.setString(4, gym_addr);
					pstmt.setString(5, gym_salary);
					pstmt.setInt(6, 0);
					pstmt.setString(7, LocalDateTime.now().toString());
					pstmt.setString(8, gym_images);
				int result = pstmt.executeUpdate();
				
				return (result==1) ? true : false;			
				
			} finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		

}
