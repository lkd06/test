package com.exe.project;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.MemberDAO;
import com.exe.dao.packageDAO;
import com.exe.dto.MemberDTO;

@Controller
public class memberController {

	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	@Autowired
	@Qualifier("packDAO")
	packageDAO packDAO;
	
	@RequestMapping(value = "/login.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String login(MemberDTO dto,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		//���Է½�
		if(dto.getPhone().equals("")) {
			session.setAttribute("message","Phone ���Է�");
		}else if(dto.getPw().equals("")) {
			session.setAttribute("message","Pw ���Է�");
		}else { //�Է½� Ȯ��
			//���߿� phone,pw �����ؼ� �ұ��ϴ���
			dto = dao.login(dto);
			  
			if(dto==null) {
				session.setAttribute("message","�α��� ����"); 
			}else {
				session.setAttribute("memDTO", dto);
				Calendar calen = new GregorianCalendar();
				int year = calen.get(Calendar.YEAR);
				int month = calen.get(Calendar.MONTH)+1;
				String ym=Integer.toString(year)+Integer.toString(month);
				//���⼭ package ���̺� phone�� yd�� Ž���Ͽ� ������ �׳� �ΰ�
				//������ package ���̺� insert�ؼ� �ʿ��� ������ �ҷ��� ��� �����ϵ���
				packDAO.existCheck(dto.getPhone(), ym,dto.getPriceNum());
			}
		}
		
		return "redirect:/#";
	}
	
	@RequestMapping(value = "/logout.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("memDTO");
		return "redirect:/#";
	}
	
	@RequestMapping(value = "/signup.action", method = RequestMethod.GET)
	public String joinView() {
		return "login/signup";
	}
	
	@RequestMapping(value = "/signupview.action", method = RequestMethod.GET)
	public String joinViewIm() {
		return "login/signView";
	}
	
	@RequestMapping(value = "/signup.action", method = RequestMethod.POST)
	public String joinUser(MemberDTO dto) {
		dao.insertData(dto);
		return "redirect:/#";
	}
	
	@RequestMapping(value = "/userinfo.action", method = RequestMethod.GET )
	public String userInfoView(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("memDTO");
		if(mem==null) {
			//�α��� ���°� �ƴ� �� �ϴ� main���� ����
			//���߿� ���� �޼��� ���� �� ���� ������
			return "redirect:/#";
		}
		mem = dao.memInfo(mem.getPhone());
		model.addAttribute("dto",mem);
		
		return "login/userInfo";
	}
	
	@RequestMapping(value = "/signout.action", method = {RequestMethod.POST,RequestMethod.GET})
	public String signout(HttpServletRequest request,HttpServletResponse response,MemberDTO dto) throws IOException {
		
		dao.deleteUser(dto.getPhone());
		HttpSession session = request.getSession();
		session.removeAttribute("memDTO");
		
		return "redirect:/#";
	}
	
	@RequestMapping(value = "/checkpw.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String checkpw(HttpServletRequest request,HttpServletResponse response, MemberDTO dto,Model model) throws IOException {
		
		boolean pwCheck = dao.pwCheck(dto);
		
		if(!pwCheck) {
			//�޼��� �� ���
			model.addAttribute("message", "PW����ġ");
			return "redirect:/userinfo.action";
		}
		
		request.setAttribute("dto", dto);
		
		return "login/update";
	}
	
	@RequestMapping(value = "/update.action")
	public ModelAndView update() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login/update");
		
		return mav;
	}
	
	@RequestMapping(value = "/update_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String update_ok(HttpServletRequest request,HttpServletResponse response, MemberDTO dto) {

		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setBirth(request.getParameter("birth"));
		
		dao.update(dto);
		
		request.setAttribute("dto", dto);
		
		return "login/userInfo";
	}
	
	@RequestMapping(value = "/idCh.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String idCheck(HttpServletRequest request) {
		
		String phone = request.getParameter("phone");
		
		if(dao.phoneCh(phone)==false) {
			request.setAttribute("message", "�ߺ��� ID �Դϴ�.");
		}else {
			request.setAttribute("message", "��밡���� ID �Դϴ�.");
		}
		
		request.setAttribute("phone", phone);
		
		return "login/idCheck";
	}
	
	@RequestMapping(value = "/pwCh.action", method = RequestMethod.GET)
	public String pwCheck(HttpServletRequest request) {
		String pw = request.getParameter("pw");
		String pwCheck = request.getParameter("pwCheck");
		request.removeAttribute("pwChMess");
		if(pw.equals(pwCheck)) {
			request.setAttribute("pwChMess", "PW ��ġ");
		}else {
			request.setAttribute("pwChMess", "PW ����ġ");
		}
		return "login/pwmess";
	}
}
