package jdbc;

import java.sql.*;
import javax.naming.*;

import util.ConnectionPool;

import java.util.ArrayList;

public class GymDAO {

	//gymlist.jsp
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
		         
		         ArrayList<GymDTO> gyms = new ArrayList<GymDTO>();
		         
		         while(rs.next()) {
		        	 gyms.add(new GymDTO(rs.getInt("gym_no"),
		                                 rs.getString("gym_name"),
		                                 rs.getString("gym_content"),
		                                 rs.getFloat("gym_latitude"),
		                                 rs.getFloat("gym_longtitude"),
		                                 rs.getString("gym_area"),
		                                 rs.getInt("gym_salary"),
		                                 rs.getBoolean("gym_secret")));
		         }
		         return gyms;
		         
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

		         
		         String gym_name = rs.getString(1);
		         String gym_content = rs.getString(2);
		         float gym_latitude = rs.getFloat(3);
		         float gym_lontitude = rs.getFloat(4);
		         String gym_area = rs.getString(5);
		         int gym_salary = rs.getInt(6);
		         
				GymDTO boards = new GymDTO(gym_no, gym_name, gym_content, gym_latitude, gym_lontitude, gym_area, gym_salary, false);
		         
		         return boards;
		         
		      }finally {
		         if(rs != null) rs.close();
		         if(pstmt != null) pstmt.close();
		         if(conn != null) conn.close();
		      }

	}


		      
// gymadd.jsp
public boolean insert(String gym_no, String gym_name, String gym_content, String gym_latitude, String gym_longtitude)
throws NamingException, SQLException {
	  
	  Connection conn = null;
	  PreparedStatement pstmt = null;
	  
	  try {
		  String sql = "INSERT INTO gym VALUES(?,?,?,?,?)";
		  conn = ConnectionPool.get();
		  pstmt = conn.prepareStatement(sql);
		     pstmt.setInt(1, 0);
		     pstmt.setString(2, gym_name);
		     pstmt.setString(3, gym_content);
		     pstmt.setString(4, gym_latitude);
		     pstmt.setString(5, gym_longtitude);
		  int result = pstmt.executeUpdate();		  
		  
		  
		  return (result==1) ? true : false;
	  } finally {
	         if(pstmt != null) pstmt.close();
	         if(conn != null) conn.close();
	      }
	  


	}



}
