<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<<<<<<< HEAD
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>

</head>


<body>
<h2>ȸ������</h2>
${checkingValue}
<form action="join" method="post"> <!-- ���⼭�� form�� ���� �̸� -->
	<input type="text" name="id" id="id" placeholder="���̵�" value="${dto.id}">
	<button class="idChk" type="button" id="idChk" onclick="fn_Check();" >�ߺ� Ȯ��</button>
    ${valid_id}<br>    
	<input type="password" name="pw" id="pw"placeholder="�н�����">
	${valid_pw}<br>
	<input type="password" name="pw_check" id="pw_check" placeholder="�н����� Ȯ��">
	<!--  ${check}<br>-->
	<div class="check_font" id="pwCheck"></div>
	
=======
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
<script type="text/javascript">
function joinCheck(){
	var $id=$("#id");
	var $pw=$("#pw");
	
	if($id.val().trim().length==0){
		alert('���̵� �Է��ϼ���');
		$id.focus();
		return false;
	}
	
	if($pw.val().trim().length==0){
		alert('��й�ȣ�� �Է��ϼ���')
		$pw.focus();
		return false;
	}
	if(confirm("ȸ������ �Ͻðڽ��ϱ�?")){
		alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
		$("form").submit();
	}
	return true;
}
	

</script>
 -->

<h2>ȸ������</h2>

<form action="join" method="post"> <!-- ���⼭�� form�� ���� �̸� -->
	<input type="text" name="id" placeholder="���̵�" value="${dto.id}">
    ${valid_id}<br>    
	<input type="password" name="pw" placeholder="�н�����">
	${valid_pw}<br>
	<input type="password" name="pw_check" placeholder="�н����� Ȯ��">
	${check}<br>
>>>>>>> b67e7d9fb1d52cc32043668afb99a5ff0489ee3e
	<input type="text" name="name" placeholder="�̸�" value="${dto.name}">	
	${valid_name}<br>
	<input type="text" name="email" placeholder="�̸���" value="${dto.email}">
	${valid_email}<br>	
	<input type="text" name="mobile" placeholder="��ȭ��ȣ" value="${dto.mobile}"><br>
	<input type="text" name="address" placeholder="�ּ�" value="${dto.address}" ><br>
<<<<<<< HEAD
 	<input type="submit" value="ȸ������" onclick="idCheck();"/>	
	</form>
	
	
	
	<script>
	function valid(){
		if(checkingValue==true)
			alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');
			
	}
	
	
	function fn_Check(){
		
		$.ajax({
			url:"idChk",
			data: {"id" : $("#id").val()},
			success:function(data){
				if(data==1){
					alert("�ߺ��� ���̵��Դϴ�. ");
				}
				else alert("��밡���� ���̵��Դϴ�.");
			},error:function(){
				console.log("�ý��� �����Դϴ�.");
			}
		});
	}
	
	$( "#pw_check" ).blur(function() {
		var pw=$('#pw').val();
		var pw_check=$('#pw_check').val();
		if(pw!=pw_check) $('#pwCheck').text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		else  $('#pwCheck').text("");
	});
					
			
	
</script>

	
=======
 	<input type="submit" value="ȸ������"/>	
	</form>
	
	
>>>>>>> b67e7d9fb1d52cc32043668afb99a5ff0489ee3e
	<!-- <label for = "gender">���� : </label> -
	����: 
  <input type = "radio" name = "gender" value = "����" id="woman" checked = "checked"> ����    
  <input type = "radio" name = "gender" value = "����" id="man"> ����<br>
  -->
 <!--  ���� ����: 
  <input type="text" name="birthYear" placeholder="��(4����)">	
  <select name="birthMonth">
  	<option value="1">1��</option>
  	<option value="2">2��</option>
  	<option value="3">3��</option>
  </select> 
  <input type="text" name="birthDate" placeholder="��"><br>
 --> 

	<!-- <input type="button" value="���" onclick="javascript:location.href='index';">  -->

</body>
</html>