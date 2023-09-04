<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
		<h1>회원가입</h1> <br>
		이름:	 <input type="text" name="nm" value="KIM" readonly><br>
		아이디:	 <input type="id" name="id" value="abc123" readonly><br>
		이메일:	 <input type="email" name="email" value="aaa@gmail.com"><br>
		비밀번호 입력:	 <input type="password" name="pwd" value="1234"> 8~20자 영문, 숫자, 특수문자 포함 <br>
		비밀번호 확인:	 <input type="password" name="pwd" value="1234">비밀번호를 한번 더 입력하세요<br>
		휴대폰 번호 : <input type="number" name="pn" value="000-0000-0000"><br>
		주소 : <input type="address" name="addr" value="aaa"><br>
		<input type="address" name="addr" value="bbb">
		<input type="address" name="addr" value="ccc"><br>
		계약서 <br>
		<input type="checkbox" name="agree" value="check"> 동의합니다 
		<input type="checkbox" name="agree" value="check"> 동의하지 않습니다 <br>
		<button>고객 회원가입</button>
		<button>가맹점주 회원가입</button>
</body>
</html>