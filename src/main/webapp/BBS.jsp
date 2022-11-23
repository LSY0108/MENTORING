<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.bbsDAO"%>
<%@ page import="bbs.bbsDTO"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
	a, a:hover {
	color:#000000;
	text-decoration : none;
	}
	
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
	


</style>
</head>
<body>

	<%
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
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
				<li><a href="TOC.jsp">HOME</a></li>
			</ul>
		</nav>
		<%
		} else {
		%>
		<nav>
			<ul>
				<li><a href="logout.jsp">LOGOUT</a></li>
				<li>|</li>
				<li><a href="TOC.jsp">HOME</a></li>
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
		<table class="table table-bordered" style="text-align: center; border:1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: grey; text-align: center;">번호</th>
					<th style="background-color: grey; text-align: center;">제목</th>
					<th style="background-color: grey; text-align: center;">작성자</th>
					<th style="background-color: grey; text-align: center;">작성일</th>
					<th style="background-color: grey; text-align: center;">조회수</th>
				</tr>
			</thead>
			<tbody>
			<%
				bbsDAO bbsDAO = new bbsDAO();
				ArrayList<bbsDTO> list = bbsDAO.getList(pageNumber);
				for(int i =0; i < list.size(); i++){
					
			%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></a></td>
						<td><%= list.get(i).getUserID()%></td>
						<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분"%></td>
						<td><%=list.get(i).getViewcount()%></td>
					</tr>
					
			<%
				}
			%>
			</tbody>
		</table>
		
		<%
			if(pageNumber != 1) {
		%>
			<a href="BBS.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
		<%
			} if(bbsDAO.nextPage(pageNumber + 1)) {
		%>
		
			<a href="BBS.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
		<%
			}		
		%>
		
		<!-- 글쓰기 버튼 -->
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</div>
</div>
</section>
</body>
</html>

