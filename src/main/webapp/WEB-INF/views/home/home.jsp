
<%@page import="product.spring.DAO.NgonNguDAO"%>
<%@page import="java.util.Map"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="product.spring.entities.Taikhoan"%>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<%
	Map<String, String> showLanguage = new NgonNguDAO().EnglishLanguage();
String language = (String) session.getAttribute("language");
if (language != null) {
	if (language.equals("Vietnamese")) {
		showLanguage = new NgonNguDAO().VietnameseLanguage();
	} else if (language.equals("English")) {
		showLanguage = new NgonNguDAO().EnglishLanguage();
	}
}
%>
<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<style type="text/css">
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
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<body>

	<section>
		<h1 class="w3-center w3-text-red"><%=showLanguage.get("Home.TieuDe")%></h1>
		<a></a>
		<form>
			<div class="w3-row w3-center">
				<c:set var="nhanvientop" value="${sessionScope.Nhanvientop}" />
				<c:if test="${not empty nhanvientop}" />
				<c:set var="count" value="0" />
				<c:forEach var="rows" items="${nhanvientop}">
					<c:set var="count" value="${count +1}" />
					<div class="w3-col m2 l3 w3-padding-32">
						<div class="card h-100">
							<a>ID: NV${rows[0]}</a>
							<div class="w3-center">
								<img class="card-img-top" src="${rows[2]}" alt=""
									style="width: 90%; height: 400px;">
							</div>
							<div class="card-body">
								<h4 class="card-title w3-center">
									<a>${rows[1]}</a>
								</h4>
								<p class="card-text w3-center"><%=showLanguage.get("Home.Diem")%>:
									${rows[4]}
								</p>
								<p class="card-text w3-center">${rows[3]}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</form>
		<script type="text/javascript">
			var success = "${sessionScope.success}";
			var message = "${sessionScope.message}";
			if (success != "") {
				swal(success, message, "success");
			}
			<%
				session.removeAttribute("success");
				session.removeAttribute("message");
			%>
			
		</script>
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
