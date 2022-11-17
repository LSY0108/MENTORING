<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.memberDTO"%>
<%@ page import="member.memberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	String userName = null;
	String userEmail = null;
	String userPhone = null;
	
	
	
	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	}

	if (request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
	}
	
	if (request.getParameter("userName") != null) {
		userName = (String) request.getParameter("userName");
	}
	
	 
	if (request.getParameter("userEmail") != null) {
		userEmail = (String) request.getParameter("userEmail");
	}
	
	if (request.getParameter("userPhone") != null) {
		userPhone = (String) request.getParameter("userPhone");
	} 

	if (userID == null || userPassword == null || userName == null || userEmail == null || userPhone == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back();"); //사용자 화면을 다시 전으로
		script.println("</script>");
		script.close();
		return;
	}
	
	
	memberDAO memberDAO = new memberDAO();
	int result = memberDAO.join(userID, userPassword, userName, userEmail, userPhone);
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href='TOC.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('작성 x')");
		script.println("location.href='register.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>