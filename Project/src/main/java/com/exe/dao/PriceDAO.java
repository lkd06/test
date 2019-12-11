package com.exe.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.exe.dto.PriceDTO;;

public class PriceDAO {
	
private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) throws Exception{
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public int getMaxNum() {
		
		int maxNum=0;
		StringBuilder sql = new StringBuilder();
		
		sql.append("select nvl(max(num),0) from price");
		maxNum = jdbcTemplate.queryForInt(sql.toString());
		
		return maxNum;
		
	}
	
	public List<PriceDTO> getList(String str,int start, int end){
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from ( ").
		append("select rownum rnum,data.* from( ").
		append("select num, subject ,gb ,tel, ").
		append("content,  price, list, content2 from price order by price ");
		sql.append(str).append(" ) data)");
		sql.append("where rnum >= ? and rnum <= ?");
		
		System.out.println(sql);
		
		List<PriceDTO> lists = jdbcTemplate.query(sql.toString(), new Object[] {start, end}, new RowMapper<PriceDTO>() {
			
			@Override
			public PriceDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				PriceDTO dto = new PriceDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setGb(rs.getString("gb"));
				dto.setTel(rs.getString("tel"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getInt("price"));
				dto.setList(rs.getString("list"));
				dto.setContent2(rs.getString("content2"));
				
				
				return dto;
			}
			
			
		});
		
		return lists;
	}
	
	public int getDataCount() {
		int result=0;
		StringBuilder sql = new StringBuilder();
		
		sql.append("select nvl(count(*),0) from price");
		
		result = jdbcTemplate.queryForInt(sql.toString());
		
		return result;
	}
	
	public PriceDTO getReadData(int num) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select num, subject, gb, tel, content, price, list, content2 from price where num=?");
		PriceDTO dtoOne = jdbcTemplate.queryForObject(sql.toString(), new RowMapper<PriceDTO>() {

			@Override
			public PriceDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				PriceDTO dto = new PriceDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setGb(rs.getString("gb"));
				dto.setTel(rs.getString("tel"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getInt("price"));
				dto.setList(rs.getString("list"));
				dto.setContent2(rs.getString("content2"));
				
				return dto;
			}
		}, num);
		
		return dtoOne;
	}
	
}
