<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.bbsDTO"%>
<%@ page import="bbs.bbsDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
header {
	width: 60%;
	height: 150px;
	margin-left: 250px;
	background-color: #FAF4C0;
	background-repeat: no-repeat;
	background-position: right center;
}

header nav {
	float: right;
	width: 100%;
	margin-top: 85px;
}

nav ul {
	list-style-type: none;
}

nav ul li {
	display: inline;
	float: right;
	font-weight: bold;
	margin: 15px;
}

nav ul li a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: plum;
}

footer p {
	padding: 20px;
}

h1 {
	text-align: left;
	margin: 30px;
	font-size: 3.5em;
	color: #353535;
}

section {
	float: left;
	margin-left: 250px;
}



footer p {
	padding: 10px;
}

footer {
	clear: both;
	width: 800px;
	margin-bottom: 1px;
	margin-left: 250px;
	background-color: #353535;
	color: white;
	text-align: center;
}
</style>
</head>


<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'"); //사용자 화면을 다시 전으로
		script.println("</script>");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='BBS.jsp'"); //사용자 화면을 다시 전으로
		script.println("</script>");
	}
	bbsDTO bbs = new bbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다..')");
		script.println("location.href='BBS.jsp'"); //사용자 화면을 다시 전으로
		script.println("</script>");
	}
	%>


	<header>
	
		<nav>
			<ul>
				<li><a href="logout.jsp">LOGOUT</a></li>
				<li>|</li>
				<li><a href="TOC.html">HOME</a></li>
			</ul>
		</nav>
	
		<h1>
			<pre>
                
With My Pet</pre>
		</h1>

	</header>


	<section>
		<h2>반려동물 정보 게시판</h2>

	   <div class="container">
      <div class="row">
         <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
            <table class="table table-bordered"
               style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th style="background-color: grey; text-align: center;">게시판 글 수정 양식</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle() %>"></td>
                  </tr>   
                  <tr>
                     <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%=bbs.getBbsContent() %></textarea></td>
                  </tr>
               </tbody>
            </table>
            <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
         </form>

      </div>
   </div>

	</section>


	<footer>
		<p>이용약관 | 개인정보처리방침</p>
	</footer>
</body>
</html>