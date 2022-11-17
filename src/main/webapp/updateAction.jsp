<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.bbsDTO"%>
<%@ page import="bbs.bbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String bbsTitle = null;
	String bbsContent = null;

	if (session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if (request.getParameter("bbsTitle") != null) {
		bbsTitle = (String) request.getParameter("bbsTitle");
	}
	if (request.getParameter("bbsContent") != null) {
		bbsContent = (String) request.getParameter("bbsContent");
	}

	
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		script.close();
	}	
		int bbsID = 0;
		if(request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='BBS.jsp'"); 
			script.println("</script>");
		}
		bbsDTO bbs = new bbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다..')");
			script.println("location.href='BBS.jsp'"); 
			script.println("</script>");
			
		}else{
			if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null 
			||request.getParameter("bbsTitle").equals("") ||request.getParameter("bbsContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()"); 				
				script.println("</script>");
				script.close();
			}else{
				
				bbsDAO bbsDAO = new bbsDAO();
				int result = bbsDAO.update(bbsID,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
			
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공')");
					script.println("location.href='BBS.jsp'");
					script.println("</script>");
			}
		}
	}
%>