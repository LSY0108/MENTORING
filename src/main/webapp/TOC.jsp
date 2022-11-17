<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#left {
	left: 70px;
	top: 200px;
	bottom: 0;
	width: 200px;
}

#left ul {
	background-color: #353535;
	list-style: none;
	margin: 0;
	padding: 0;
}

#left ul li {
	margin-left: 20px;
	padding-top: 5px;
	background-color: #353535;
}

#left ul li a {
	background-color: #353535;
	color: white;
	text-decoration: none;
}

#left ul li a:hover {
	color: plum;
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

		
	</section>

	<aside id="left">
		<h4>카테고리</h4>
		<ul>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">훈련방법</a></li>
			<li><a href="BBS.jsp">자유게시판</a></li>
		</ul>
	</aside>

	<footer>
		<p>이용약관 | 개인정보처리방침</p>
	</footer>
</body>
</html>