<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.bank.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="model.bank.BankDAO"/>
<jsp:useBean id="vo" class="model.bank.BankVO"/>
<jsp:setProperty property="*" name="vo"/>
    
<%
	String action=request.getParameter("action");
	
	if(action.equals("trans")){
		int bal=Integer.parseInt(request.getParameter("bal"));
		int give=Integer.parseInt(request.getParameter("give"));
		int take=Integer.parseInt(request.getParameter("take"));
		String str="";
		if(dao.trans(bal, give, take)){
			str=bal+"원 이체 완료!";
		} else{
			str="잔액 부족! 이체 실패!";
		}
		request.setAttribute("str", str);
		pageContext.forward("transfer.jsp");
	}
	else if(action.equals("check")){
		BankVO data=dao.checkBal(vo);
		String str="";
		if(data.equals(null)){
			str="계좌번호를 확인해주세요!";
		} else{
			str=data.getName()+"님의 "+data.getBname()+"은행의 계좌 잔액은 "+data.getBalance()+"원 입니다!";
		}
		request.setAttribute("str", str);
		pageContext.forward("check.jsp");
	}
	



%>