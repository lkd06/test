package com.exe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.MemberDTO;
import com.exe.util.Cryto;

public class MemberDAO {
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public void insertData(MemberDTO dto) {
		String salt = Cryto.generateSalt();
		String pw = dto.getPw();
		
		dto.setSalt(salt);
		pw = Cryto.getEncrypt(pw, salt);
		dto.setPw(pw);
		
		sessionTemplate.insert("membermapper.insertData", dto);
	}
	
	public String findSalt(String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		String salt = sessionTemplate.selectOne("membermapper.findSalt",map);
		
		return salt;
	}
	
	public MemberDTO login(MemberDTO dto) {
		
		String salt = findSalt(dto.getPhone());
		
		if(salt.equals("") || salt==null) {
			return null;
		}
		
		String pw = dto.getPw();
		
		pw = Cryto.getEncrypt(pw, salt);
		dto.setPw(pw);
		
		MemberDTO result = sessionTemplate.selectOne("membermapper.getOneData", dto);
		
		return result;
	}
	
	public MemberDTO memInfo(String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		MemberDTO result = sessionTemplate.selectOne("membermapper.findMemInfo", map);
		
		return result;
	}
	
	public boolean pwCheck(MemberDTO dto) {
		
		String salt = findSalt(dto.getPhone());
		String inputpw = dto.getPw();
		
		inputpw = Cryto.getEncrypt(inputpw, salt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", dto.getPhone());
		MemberDTO result = sessionTemplate.selectOne("membermapper.findMemInfo", map);
	
		//비밀번호 일치할 때
		if(inputpw.equals(result.getPw())) {
			return true;
		}
		
		return false;
	}
	
	public void deleteUser(String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		sessionTemplate.delete("membermapper.deleteMem", map);
	}
	
	public void update(MemberDTO dto) {
		
		String salt = Cryto.generateSalt();
		String pw = dto.getPw();
		
		dto.setSalt(salt);
		pw = Cryto.getEncrypt(pw, salt);
		dto.setPw(pw);
		
		sessionTemplate.update("membermapper.updateMem", dto);
	}
	
	public boolean phoneCh(String phone) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("phone", phone);
		int result = sessionTemplate.selectOne("membermapper.phoneCheck", map);
		
		if(result==1) {
			return false;
		}
		
		return true;
	}
	
	public void addPoint(MemberDTO dto) {
		sessionTemplate.update("addPoint", dto);
	}
	
	//전체데이터
	public List<MemberDTO> getList(){

		HashMap<String, Object> params = new HashMap<String, Object>();
		
		List<MemberDTO> lists = sessionTemplate.selectList("membermapper.getLists",params);
		
		return lists;
	}
	
	public MemberDTO getReadData(String phone) {
		
		MemberDTO dto = sessionTemplate.selectOne("membermapper.getReadData",phone);
		
		return dto;
	}
}
