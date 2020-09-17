<%@page import="product.spring.entities.Taikhoan"%>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<head>
<style type="text/css">
article {
	margin-left: 20%;
}

section {
	min-height: 800px;
}

body {
	padding-top: 75px;
}
</style>
<title>Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%
	String quyen = session.getAttribute("QUYEN").toString();
Taikhoan tk = (Taikhoan) session.getAttribute("tk");
String ten = tk.getHoten();
session.setAttribute("name", ten);
if (quyen.equals("admin")) {
	session.removeAttribute("header");
	session.setAttribute("header", "admin_header.jsp");
	session.removeAttribute("sidebar");
	session.setAttribute("sidebar", "admin_sidebar.jsp");
} else {
	session.removeAttribute("sidebar");
	session.setAttribute("sidebar", "user_sidebar.jsp");
}
%>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!-- header start -->
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<!-- header end -->

<body>


	<a></a>

	<section>
		<jsp:include page="/WEB-INF/views/layout/${sessionScope.sidebar}" />
		<!--side-bar start <jsp:include page="/WEB-INF/views/layout/user_navigator.jsp" />-->

		<!--side-bar end -->

		<article>
			<jsp:include page="/WEB-INF/views/home/${sessionScope.page}" />
		</article>

	</section>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
<footer>
	<!-- Footer start -->
	<jsp:include page="/WEB-INF/views/layout/user_footer.jsp" />
	<!-- Footer end -->
</footer>
</html>
