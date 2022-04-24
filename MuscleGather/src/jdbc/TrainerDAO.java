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

}
