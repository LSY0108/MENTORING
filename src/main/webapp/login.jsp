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
<form action="./loginAction.jsp" method="post">
<div id="con">
    <div id="login">
    <div id="login_form"><!--????????? ???-->
    
    <form>
        <h3 class="login" style="letter-spacing:-1px;">LOGIN</h3>

  
        <hr>
        <label>
        <!-- <span>ID</span> -->
        <p style="text-align: left; font-size:12px; color:#666">ID</p>
        <input type="text" placeholder="????????? ??????" name="floatingInput" class="size">
        <!-- <input type="submit" value="??????"> -->
        <p></p>
        </label>

        <label>
        <!-- <span>PW</span> -->
        <p style="text-align: left; font-size:12px; color:#666">Password </p>
        <input type="password" placeholder="???????????? ??????" name="floatingPassword" class="size">
        <!-- <input type="submit" value="??????"> -->
        </label>

        <p>
            <input type="submit" name="Sign in" value="Sign in" class="btn">
        </p>
    </form>
    <hr>
    <p class="find">
        <span><a href="register.jsp" >????????????</a></span>
    </p>
    </div>
    <div>
    </div>
</form>
</body>
</html>