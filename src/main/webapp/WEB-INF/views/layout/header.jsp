<%@page import="product.spring.DAO.NgonNguDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	Map<String,String> showLanguage = new NgonNguDAO().EnglishLanguage();
	String language = (String) session.getAttribute("language");
	if(language!=null){
		if(language.equals("Vietnamese")){
			showLanguage = new NgonNguDAO().VietnameseLanguage();
		}
		else if(language.equals("English")){
			showLanguage = new NgonNguDAO().EnglishLanguage();
		}
	}
%>
<header class="w3-top">
	<nav class="row navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="col-md-8"></div>
		<div class="col-md-4 ml-5">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse ml-5" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> <%=showLanguage.get("Header.TrangChu") %> <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/manager"><i class="fa fa-user-tie fa-fw"></i> <%=showLanguage.get("Header.QuanLy") %></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fa fa-user-circle fa-fw"></i> <%=showLanguage.get("Header.TaiKhoan") %> </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/login"><%=showLanguage.get("Header.TaiKhoan.DangXuat") %></a> <a
								class="dropdown-item" href="${pageContext.request.contextPath}/changepass"> <%=showLanguage.get("Header.TaiKhoan.DoiMK") %></a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fa fa-language fa-fw"></i> <%=showLanguage.get("Header.NgonNgu") %> </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="DaNgonNgu?language=Vietnamese"><%=showLanguage.get("Header.NgonNguV") %></a> <a
								class="dropdown-item" href="DaNgonNgu?language=EngLish"><%=showLanguage.get("Header.NgonNguE") %></a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
</header>