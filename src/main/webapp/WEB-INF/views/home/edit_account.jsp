<%@page import="org.springframework.ui.ModelMap"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
<script type="text/javascript">
var error = "${error}";
var message = "${message}";
if (error!="") {
	swal(error, message, "error");
}
</script>
<%
session.removeAttribute("success");
session.removeAttribute("message");
	ModelMap model = new ModelMap();
	model.remove("error");
	model.remove("message");
%>
<div class="row justify-content-md-center m-0">
	<div class="col-md-6">
		<h2 class="w3-center w3-text-red mt-4"><strong>Add Account</strong></h2>
		<form:form class="my-4" action="save_account" modelAttribute="taikhoan" method="post">
			<!-- Tên đăng nhập -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Username</span>
					</div>
					<input type="text" class="form-control" name="tendangnhap" value="${sessionScope.taikhoanShow.tendangnhap}"
					readonly="readonly" />
				</div>
			</div>
			<!-- Mật khẩu -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Password</span>
					</div>
					<form:password class="form-control" path="matkhau" value="${sessionScope.taikhoanShow.matkhau}" /><form:errors path="matkhau" />
				</div>
			</div>
			<!-- Quyền -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Permission</span>
						<input id="q" type="hidden" value="${sessionScope.taikhoanShow.quyen}" />
						<div
							class="custom-control custom-radio custom-control-inline mt-2 ml-5">
							<form:radiobutton class="custom-control-input" id="customRadio"
								path="quyen" value="admin" /> <label
								class="custom-control-label" for="customRadio">Admin</label>
						</div>

						<div
							class="custom-control custom-radio custom-control-inline mt-2 ml-4">
							<form:radiobutton class="custom-control-input"
								id="customRadio2" path="quyen" value="user" /> <label
								class="custom-control-label" for="customRadio2">User</label>
						</div>
						<form:errors path="quyen" />
					</div>
				</div>
			</div>
			<!-- Họ tên -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Name</span>
					</div>
					<form:input type="text" class="form-control" path="hoten"  value="${sessionScope.taikhoanShow.hoten}" /><form:errors path="hoten" />
				</div>
			</div>
			<br/>
			<div class="w3-center mt-2 ml-5">
				<div>
					<button style="width: 100px;" class="btn btn-primary" type="submit">Save</button>
				</div>
			</div>
		</form:form>
	</div>
</div>
<script type="text/javascript">
	var quyen = document.getElementById("q");
	var chon = document.getElementsByName("quyen");
	if(quyen.value == "admin"){
		chon[0].checked = true;
	}
	else if(quyen.value == "user"){
		chon[1].checked = true;
	}
</script>
