<%@page import="org.springframework.ui.ModelMap"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>

<div class="row justify-content-md-center m-0">
	<div class="col-md-6">
		<h2 class="w3-center w3-text-red mt-4"><strong>Add Staff</strong></h2>
		<form:form class="my-4" action="save_staff" modelAttribute="nhanvien" method="post" enctype="multipart/form-data">
			<!-- Họ tên -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Name</span>
					</div>
					<form:input type="text" class="form-control" path="hoten" /><form:errors path="hoten" />
				</div>
			</div>
			<!-- Giới tính -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Gender</span>

						<div
							class="custom-control custom-radio custom-control-inline mt-2 ml-5">
							<form:radiobutton class="custom-control-input" id="customRadio"
								path="gioitinh" value="1" /> <label
								class="custom-control-label" for="customRadio">Male</label>
						</div>

						<div
							class="custom-control custom-radio custom-control-inline mt-2 ml-4">
							<form:radiobutton class="custom-control-input"
								id="customRadio2" path="gioitinh" value="0" /> <label
								class="custom-control-label" for="customRadio2">Female</label>
						</div>
						<form:errors path="gioitinh" />
					</div>
				</div>
			</div>
			<!-- Ảnh -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Image</span>
					</div>
					<div class="custom-file">
						<form:input type="file" path="hinhfile" class="custom-file-input" id="inputGroupFile01" />
							<label class="custom-file-label" for="inputGroupFile01"></label>
					</div>
				</div>
			</div>
			<!-- Ngày sinh -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Birthday</span>
					</div>
					<form:input type="date" class="form-control" path="datestring" value="${ngay}" /><form:errors path="datestring" />
				</div>
			</div>
			<!-- Lương -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Salary</span>
					</div>
					<form:input type="text" class="form-control" path="luong" /><form:errors path="luong" />
				</div>
			</div>
			<!-- Cấp độ -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Level</span>
					</div>
					<form:input type="number" class="form-control" path="capdo" max="10"
						min="1" step="1" /> <form:errors path="capdo" />
				</div>
			</div>
			<!-- Email -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Email</span>
					</div>
					<form:input type="email" class="form-control" path="email" /><form:errors path="email" />
				</div>
			</div>
			<!-- SĐT -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Phone Number</span>
					</div>
					<form:input type="text" class="form-control" path="sdt" /><form:errors path="sdt" />
				</div>
			</div>
			<!-- Ghi chú -->
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Note</span>
					</div>
					<form:textarea class="form-control" path="ghichu" rows="3"></form:textarea>
				</div>
			</div>

			<c:set var="phongban" value="${sessionScope.Phongban}" />
			<c:if test="${not empty phongban}" />
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Department</span>
					</div>
					<form:select class="form-control" path="phongban.maphongban">
						<c:set var="count" value="0" />
						<c:forEach var="rows" items="${phongban}">
							<c:set var="count" value="${count +1}" />
							<option value="${rows.maphongban}">${rows.tenphongban}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div>
				<br />
			</div>
			<div class="w3-center mt-2 ml-5">
				<div>
					<button style="width: 100px;" class="btn btn-primary" type="submit">Add</button>
				</div>
			</div>
		</form:form>
	</div>
	</div>
<script type="text/javascript">
var error = "${error}";
var message = "${message}";
if (error!="") {
	swal(error, message, "error");
}
</script>