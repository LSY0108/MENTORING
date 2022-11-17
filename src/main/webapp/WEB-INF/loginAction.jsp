<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.memberDTO"%>
<%@ page import="member.memberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = (String) request.getParameter("floatingInput");
	String userPassword = (String) request.getParameter("floatingPassword");
	
	memberDAO memberDAO = new memberDAO();
	int result = memberDAO.login(userID, userPassword);
	if (result == 1) {
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인에 성공했습니다.')");
		script.println("location.href='TOC.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호를 다시 작성해주세요.')");
		script.println("location.href='login.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디를 작성해주세요.')");
		script.println("location.href='login.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('db오류')");
		script.println("location.href='login.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>