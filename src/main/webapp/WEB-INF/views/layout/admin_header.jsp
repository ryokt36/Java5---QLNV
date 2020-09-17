
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<header>
	<nav class="row navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="col-md-6"></div>
		<div class="col-md-6 ml-5">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse ml-5"
				id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/home"><i
							class="fas fa-home"></i> Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/department"><i
							class="fas fa-building"></i> Department</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/staff">Staff</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Record</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Statistical</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/account">Account Management</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Account </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/login">Logout</a> <a
								class="dropdown-item" href="${pageContext.request.contextPath}/changepass">Change Password</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Language </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Vietnam</a> <a
								class="dropdown-item" href="#">English</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
</header>