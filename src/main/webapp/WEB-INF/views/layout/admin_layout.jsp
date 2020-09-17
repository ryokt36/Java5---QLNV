<!DOCTYPE html>
<html lang="en">
<head>
<title>CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
</head>
<body>

<section>
	<!--side-bar start <jsp:include page="/WEB-INF/views/layout/admin_navigator.jsp"/>-->
  	
  	<!--side-bar end -->
  
  <article>
  	<jsp:include page="/WEB-INF/views/${param.view}"/>
  </article>
  
</section>

</body>
</html>
    