package com.spring.biz.uesr.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.spring.biz.common.JDBCUtil;
import com.spring.biz.uesr.UserVO;

@Repository("userDAO") // 데이터 저장영역?
public class UserDAO {
	//JDBC 관련 변수
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	public UserDAO() {
		System.out.println(">> UserDAO() 객체생성");
	}
	
	// SQL 문 
	private final String USER_GET
		= "SELECT * FROM USERS WHERE ID = ? AND PASSWORD = ?";
	
	public UserVO getUser(UserVO vo) {
		System.out.println("====> JDBC로 getUser() 실행 ");
		UserVO user = null;
		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				user = new UserVO(
						rs.getString("ID"),
						rs.getString("PASSWORD"),
						rs.getString("NAME"),
						rs.getString("ROLE")
						);
				
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		
		return user;
	}

}
