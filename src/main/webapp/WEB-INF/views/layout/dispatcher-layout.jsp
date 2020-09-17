<% 
	
	String Quyen = request.getParameter("QUYEN");
	if(Quyen.startsWith("admin")){
		pageContext.forward("admin_header.jsp");
	} else {
		pageContext.forward("user_header.jsp");
	}
%>