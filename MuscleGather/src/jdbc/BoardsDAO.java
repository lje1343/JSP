package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import jdbc.*;
import util.ConnectionPool;

public class BoardsDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	  // asklist.jsp
      public ArrayList<BoardsDTO> agetList() throws NamingException, SQLException, Exception{
         Connection conn =null;
         PreparedStatement pstmt =null;
         ResultSet rs =null;
         ArrayList<BoardsDTO> boards = new ArrayList<BoardsDTO>();
         
         try {
            String sql = "SELECT * FROM ask_board";
            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
            rs =pstmt.executeQuery();
            
            while(rs.next()) {
            boards.add(new BoardsDTO(
                              rs.getString("ask_title"),
                              rs.getString("ask_content")
                  ));
            
            }
            return boards;
         }finally{
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
            
         }
      }
     
      
      // noticelist.jsp
      public ArrayList<BoardsDTO> ngetList(int start_pointer, int LINE_PER_PAGE) throws NamingException, SQLException, Exception{
         Connection conn =null;
         PreparedStatement pstmt =null;
         ResultSet rs =null;
         ArrayList<BoardsDTO> boards = new ArrayList<BoardsDTO>();
         
         try {
            String sql = "SELECT * FROM notice_board ORDER BY notice_regdate DESC LIMIT ?,?";
            conn = ConnectionPool.get();
            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, start_pointer);
	            pstmt.setInt(2, LINE_PER_PAGE);
	            
            rs =pstmt.executeQuery();
            
            while(rs.next()) {
            boards.add(new BoardsDTO(
                              rs.getString("notice_no"),
                              rs.getString("user_no"),
                              rs.getString("notice_title"),
                              rs.getString("notice_content"),
                              rs.getString("notice_regdate"),
                              rs.getString("view_cnt"),
                              rs.getString("notice_image")

                  ));
            
            }
            return boards;
         }finally{
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
            
         }
      }

      
/*
  	// noticedetail.jsp
  	public BoardsDTO getBoards(String user_no) throws NamingException, SQLException {
  		String sql = "SELECT * FROM notice_board WHERE user_no = ?";
  		BoardsDTO notice = null;
  		UserDTO user = new UserDAO().getUser(user_no);
  		try {
  			conn = ConnectionPool.get();
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setString(1, user_no);
  			rs = pstmt.executeQuery();
  			rs.next();
  			notice = new BoardsDTO(
  					user.getUser_no(),
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
  					rs.getString("notice_no"),
  					rs.getString("notice_title"),
  					rs.getString("notice_content"),
  					rs.getString("notice_regdate"),
  					rs.getString("view_cnt"),
  					rs.getString("notice_image")
  					);
  			
  		} catch (NamingException e) {
  			e.printStackTrace();
  		} catch (SQLException e) {
  			e.printStackTrace();
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			try {
  				//null이 아니면 close(메모리에서 해제)시킨다.
  				if(rs != null) rs.close();
  				if(pstmt != null) pstmt.close();
  				if(conn != null) conn.close();
  			} catch (SQLException e) {
  				e.printStackTrace();
  			} catch (Exception e) {
  				throw new RuntimeException(e);
  				//만약 예상못한 예외 발생시 메모리에서 해제가 안되면 문제가 생길 수 있으므로
  				//런타임에러 발생시켜서 강종합니다.
  			}
  		}
  		
  		return gym;
  	}
  	
*/
      
  	// noticelist.jsp
  	public ArrayList<BoardsDTO> nngetList(){
  		String sql = "SELECT user_no FROM notice_board";
  		ArrayList<BoardsDTO> notices = new ArrayList<BoardsDTO>();
  		ResultSet rs_inner = null;
  		try {
  			conn = ConnectionPool.get();
  			pstmt = conn.prepareStatement(sql);
  			rs_inner = pstmt.executeQuery();
  			
  			while(rs_inner.next()) {
  				String u_no = rs_inner.getString("user_no");
  				notices.add(getBoards(u_no));
  			}
  			
  		} catch (NamingException e) {
  			e.printStackTrace();
  		} catch (SQLException e) {
  			e.printStackTrace();
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			try {
  				if(rs_inner != null) rs_inner.close();
  				if(pstmt != null) pstmt.close();
  				if(conn != null) conn.close();
  			} catch (SQLException e) {
  				e.printStackTrace();
  			} catch (Exception e) {
  				throw new RuntimeException(e);
  			}
  		}
  		
  		return notices;
  	}
  	
	// notice_board 전체 row 숫자 세기
	public int getNoticeCount() throws NamingException, SQLException, Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			String sql = "SELECT COUNT(*) as count FROM notice_board";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt("count");
			}
			
			return count;
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close(); 
		}
	}
	
  	
  	
}