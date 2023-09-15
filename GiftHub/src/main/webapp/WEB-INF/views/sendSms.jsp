<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="/scripts/jquery-ui/jquery.min.js"></script>
	<script type="text/javascript" src="/scripts/common/common-ui.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
    <h1>텍스트 메일 보내기</h1>
 
    <form action="sms/send" method="post">
        <table>
            <tr class="form-group">
                <td>발송할 전화번호</td>
                <td>
                    <input type="text" class="form-control" name="to" placeholder="이메일 주소를 입력하세요">
                </td>
            </tr>
            <tr class="form-group">        
                <td>내용</td>
                <td>
                    <textarea class="form-control" name="content" placeholder="보낼 내용을 입력하세요"> </textarea>
                </td>
            </tr>
        </table>
        <button type="submit" class="btn btn-default">발송</button>
        <a href="sms/send1?tel=01034803259&content=kimkim">보내기</a>
       <h1>${response }</h1> 
    </form>
 
 </div>
</body>
</html>