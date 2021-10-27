package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.board.dto.BoardWithDTO;

public class BoardWithDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public BoardWithDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("board용 드라이브 로드 성공");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "java");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<BoardWithDTO> list() {
		String sql = "select * from test_board order by id asc";
		ArrayList<BoardWithDTO> list = new ArrayList<BoardWithDTO>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				BoardWithDTO dto = new BoardWithDTO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));

				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void writeSave(String name, String title, String content) {
		String sql = "insert into test_board(id,name,title,content,idgroup,step,indent)"
				+ "values(test_board_seq.nextval,?,?,?,test_board_seq.currval,0,0)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public BoardWithDTO contentView(String num) {
		upHit(num);
		String sql = "select * from test_board where id=" + num;
		BoardWithDTO dto = new BoardWithDTO();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {// 데이터가 1개일경우는 while보다는 if로 쓰는게 더 좋음
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));

				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	private void upHit(String num) {// 조회수 올라가는 메소드
		String sql = "update test_board set hit=hit+1 where id=" + num;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void modify(String name, String id, String title, String content) {
		String sql = "update test_board set name=?,title=?,content=? where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setString(4, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int delete(String id) {
		String sql = "delete from test_board where id=" + id;
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
