<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.bbsDTO" %>
<%@ page import="bbs.bbsDAO" %>
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
		
		//조회수
		bbsDAO B = new bbsDAO();
		B.viewcountUpdate(bbsID);
	%>


	<header>
		<%
		if (userID == null) {
		%>
		<nav>
			<ul>
				<li><a href="register.jsp">회원가입 </a></li>
				<li>|</li>
				<li><a href="login.jsp">LOGIN</a></li>
				<li>|</li>
				<li><a href="TOC.html">HOME</a></li>
			</ul>
		</nav>
		<%
		} else {
		%>
		<nav>
			<ul>
				<li><a href="logout.jsp">LOGOUT</a></li>
				<li>|</li>
				<li><a href="TOC.html">HOME</a></li>
			</ul>
		</nav>
		<%
		}
		%>
		<h1>
			<pre>
                
With My Pet</pre>
		</h1>

	</header>


	<section>
		<h2>반려동물 정보 게시판</h2>

	   <div class="container">
      <div class="row">
            <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
               <thead>
                  <tr>
                     <th colspan="3" style="background-color: grey; text-align: center;">게시판 글보기</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                   		<td style="width: 20%;">글 제목</td>
                    	<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
                  </tr>
                  <tr>
                   		<td>작성자</td>
                    	<td colspan="2"><%= bbs.getUserID() %></td>
                  </tr>
                   <tr>
                   		<td>작성일자</td>
                   		<td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" + bbs.getBbsDate().substring(14,16) + "분"%></td>
                  </tr>
                  <tr>
                   		<td>내용</td>
                   		<td colspan="2" style="min-height: 200px; text-align:left;"><%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
                  </tr>
                  <tr>
                  	<td>조회수</td>
                  	<td colspan="2"><%=bbs.getViewcount()%></td>
                  </tr>
               </tbody>
            </table>
            <a href = "BBS.jsp" class = "btn btn-primary">목록</a>
            <%
            	if(userID != null && userID.equals(bbs.getUserID())) {
            %>
          	  	<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary"> 수정</a>
           	 	<a onclick ="return confirm('정말로 삭제하시겠습니까?')"href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary"> 삭제</a>
            <%
            	}
            %>
    
      </div>
   </div>
</section>

	<footer>
		<p>이용약관 | 개인정보처리방침</p>
	</footer>
</body>
</html>
