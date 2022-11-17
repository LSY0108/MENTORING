<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        
        body{
           margin:0 auto;
        }
        /* body, table, div, p ,span{font-family:'Nanum Gothic';} */
        body, table, div, p ,span{font-family:'Noto Sans KR';}
        
        a{
            text-decoration: none;
            color:#333;
        }
        #con{
            width:100%;
            height: 100vh;
            background-color:#f5f1ee;
            background-image:url("img/bg.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-size:cover;
            padding:0;
        }
        #login{
            width:600px;
            height: 600px;
            margin:0 auto;
            /* position: relative; */
            /* background:#ddd; */
        }
        #login_form{
            /* text-align:center; */
            border-radius: 10px;
            padding:50px;
            background: #fff;
            text-align: center;
            position: absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%);
        }
        .login{
            font-size:25px;
            font-weight: 900;
            color:#333;
        }

        .size{
            width:300px;
            height:30px;
            padding-left:10px;
            background-color: #f4f4f4;
            /* margin-left:10px; */
            border:none;
            border-radius: 5px;
        }

        .btn{
            width:310px;
            height: 40px;
            font-size:15px;
            background-color: #df3278;
            color:#fff;
            border:none;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn:hover{
            background:#ca296a;
        }
        hr{
            margin-top:20px;
            background:#eee;
            
        }
        .find{
            color:#ddd;
            font-size:12px;
        }
        .find span{
            padding-left:10px;
        }
        .find span::before{
            content:'|';
            color:#333;
            padding-right: 10px;
        }
        .find span:nth-child(1):before{
            content:none;
        }
        
        .find span:nth-child(1){
            padding-left:0px;
        }
        
        .find a:hover{
            color:#707070;
        }
 
  
  </style>
</head>
<body>
  <form action="./userJoinAction.jsp" method="post">
<div id="con">
    <div id="login">
    <div id="login_form"><!--로그인 폼-->
  
    <form>
        <h3 class="login" style="letter-spacing:-1px;">회원가입</h3>

  
        <hr>
         <label>
        <!-- <span>ID</span> -->
        <p style="text-align: left; font-size:12px; color:#666">이름</p>
        <input type="text" placeholder="이름 입력" name="userName" class="size">
        <!-- <input type="submit" value="확인"> -->
        <p></p>
        </label>
        
        
		 <label>
        <!-- <span>password</span> -->
        <p style="text-align: left; font-size:12px; color:#666">ID </p>
        <input type="text" placeholder="아이디 입력" name="userID"class="size">
        <!-- <input type="submit" value="확인"> -->
        </label>
        
        <label>
        <!-- <span>password</span> -->
        <p style="text-align: left; font-size:12px; color:#666">Password </p>
        <input type="password" placeholder="비밀번호 입력" name="userPassword"class="size">
        <!-- <input type="submit" value="확인"> -->
        </label>
        
         <label>
        <!-- <span>phone number</span> -->
        <p style="text-align: left; font-size:12px; color:#666">전화번호 </p>
          <select>
		 <option value="t010">010</option>
		 <option value="t011">011</option>
		  <option value="t02">02</option>	
		  <option value="t017">017</option>
		  <option value="t019">019</option>
		  <option value="t032">032</option></select>
		  <input type="=text" placeholder="전화번호 입력 (8자리 숫자만 입력)" name="userPhone" class="size" maxlength="8" size="8" />
        <!-- <input type="submit" value="확인"> -->
        </label>
        
        <label>
        <!-- <span>email</span> -->
        <p style="text-align: left; font-size:12px; color:#666">E-mail </p>
        <input type="text" placeholder="이메일 입력" name="userEmail" class="size">
        <!-- <input type="submit" value="확인"> -->
        </label>

        <p>
            <input type="submit" value="Sign in" class="btn">
        </p>
    </form>
    </form>
    <hr>
    
    </div>
    <div>
    </div>


</body>
</html>