package dto;

import java.sql.*;
import javax.naming.*;
import util.ConnectionPool;
import java.util.ArrayList;

public class GymDAO {
	


	// gymlist.jsp
	public ArrayList<GymDTO> getList()
			   throws NamingException, SQLException {
			      
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      
			      try {
			         String sql = "SELECT * FROM gym";
			         
			         conn = ConnectionPool.get();
			         pstmt = conn.prepareStatement(sql);
			         rs = pstmt.executeQuery();
			         
			         ArrayList<GymDTO> boards = new ArrayList<GymDTO>();
			         

			         while(rs.next()) {
			        	 boards.add(new GymDTO(rs.getInt("gym_no"),
			                                 rs.getString("gym_name"),
			                                 rs.getString("gym_content"),
			                                 rs.getString("gym_addr"),
			                                 rs.getInt("gym_salary"),
			                                 rs.getBoolean("gym_secret"),
			                                 rs.getString("gym_regdate"),
			                                 rs.getString("gym_images")));
			         }
			         return boards;
			         
			      }finally {
			         if(rs != null) rs.close();
			         if(pstmt != null) pstmt.close();
			         if(conn != null) conn.close();
			      }
			   }

		

	// gymdetail.jsp
	public GymDTO getDetail(int gym_no) 
			   throws NamingException, SQLException{
			      
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      
			      try {
			         String sql = "SELECT * FROM gym WHERE gym_no = ?";
			         
			         conn = ConnectionPool.get();
			         pstmt = conn.prepareStatement(sql);
			            pstmt.setInt(1, gym_no);
			         rs = pstmt.executeQuery();
			         
			         rs.next();

			        
			         Integer no = rs.getInt(1);
			         String gym_name = rs.getString(3);
			         String gym_content = rs.getString(4);
			         String gym_addr = rs.getString(5);
			         Integer gym_salary = rs.getInt(6);
			         String gym_regdate = rs.getString(8);
			         
			         GymDTO boards = new GymDTO(no,gym_name,gym_content,gym_addr,gym_salary, gym_regdate);
			         


			         return boards;
			         
			      }finally {
			         if(rs != null) rs.close();
			         if(pstmt != null) pstmt.close();
			         if(conn != null) conn.close();
			      }
			      

		}
	
	
	// gymwrite.jsp
	public boolean insert(String gym_no, String gym_name, String gym_content, String gym_addr, int gym_salary, String gym_regdate)
	throws NamingException, SQLException {
		  
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  
		  try {
			  String sql = "INSERT INTO gym VALUES(?,?,?,?,?,?)";
			  conn = ConnectionPool.get();
			  pstmt = conn.prepareStatement(sql);
			     pstmt.setInt(1, 0);
			     pstmt.setString(2, gym_name);
			     pstmt.setString(3, gym_content);
			     pstmt.setString(4, gym_addr);
			     pstmt.setInt(5, gym_salary);
			     pstmt.setString(6, gym_regdate);
			  int result = pstmt.executeUpdate();		  
			  
			  
			  return (result==1) ? true : false;
		  } finally {
		         if(pstmt != null) pstmt.close();
		         if(conn != null) conn.close();
		      }
		  


		}
	
}
