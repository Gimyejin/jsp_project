package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.care.root.board.dto.BoardDTO;

public class BoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public BoardDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("board용 드라이브 로드 성공");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","java","java");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int insert(BoardDTO dto) {
		System.out.println("board용 insert");
		String sql="insert into board values(?,?,?)";
		int result =0;
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContext());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<BoardDTO> allList() {
		System.out.println("board용 alllist");
		String sql="select * from board";
		ArrayList<BoardDTO> list= new ArrayList<BoardDTO>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContext(rs.getString("context"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<BoardDTO> myList(String context) {
		String sql="select * from board where context=?";
		ArrayList<BoardDTO> list= new ArrayList<BoardDTO>();
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, context);
			rs=ps.executeQuery();
			if(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContext(rs.getString("context"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
