<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.bbsDTO"%>
<%@ page import="bbs.bbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
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

	//로그인을 한 사람만 글을 쓸 수 있도록 코드 수정
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'"); //사용자 화면을 다시 전으로
		script.println("</script>");
		script.close();
	}else{
		//입력이 안 된 부분이 있는지 체크
		if (bbsTitle == null || bbsContent == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); //사용자 화면을 다시 전으로
			script.println("</script>");
			script.close();
		}else{
			//정상적으로 입력 되었다면 글쓰기 로직을 수행
			bbsDAO bbsDAO = new bbsDAO();
			int result = bbsDAO.write(bbsTitle, userID, bbsContent);
			//데이터베이스 오류인 경우
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
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