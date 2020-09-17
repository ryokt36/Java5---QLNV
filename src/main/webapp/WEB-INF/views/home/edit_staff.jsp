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
	<h2 class="w3-center w3-text-yellow mt-4"><strong>Edit Staff</strong></h2>
	<form:form class="my-4" action="save_staff" modelAttribute="nhanvien" method="post" enctype="multipart/form-data" >
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">ID</span>
				</div>
				<input type="text" class="form-control" name="manhanvien" value="${sessionScope.nhanvien.manhanvien}"
				 readonly="readonly" />
			</div>
		</div>
		<!-- Họ tên -->
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">Name</span>
				</div>
				<form:input type="text" class="form-control" path="hoten" value="${sessionScope.nhanvien.hoten}" /><form:errors path="hoten" />
			</div>
		</div>
		<!-- Giới tính -->
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">Gender</span>
					<input id="gt" type="hidden" value="${sessionScope.nhanvien.gioitinh}" />
					<div
						class="custom-control custom-radio custom-control-inline mt-2 ml-5">
						<form:radiobutton class="custom-control-input" id="customRadio"
							path="gioitinh" value="1" /> <label
							class="custom-control-label" for="customRadio">Male</label>
					</div>

					<div
						class="custom-control custom-radio custom-control-inline mt-2 ml-4">
						<form:radiobutton class="custom-control-input" id="customRadio2"
							path="gioitinh" value="0" /> <label
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
					<span class="input-group-text" >Image</span>
				</div>
				<div class="custom-file">
					<form:input type="file" path="hinhfile" value="${sessionScope.nhanvien.hinhanh}" class="custom-file-input"
						id="inputGroupFile01" /> <label class="custom-file-label"
						for="inputGroupFile01"></label>
				</div>
			</div>
		</div>
		<!-- Ngày sinh -->
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">Birthday</span>
				</div>
				<form:input type="date" class="form-control" value="${sessionScope.nhanvien.ngaysinh}" path="datestring" /><form:errors path="datestring" />
			</div>
		</div>
		<!-- Lương -->
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">Salary</span>
				</div>
				<form:input type="text" class="form-control" value="${sessionScope.nhanvien.luong}" path="luong" /><form:errors path="luong" />
			</div>
		</div>
		<!-- Cấp độ -->
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">Level</span>
				</div>
				<form:input type="number" class="form-control" value="${sessionScope.nhanvien.capdo}" path="capdo" max="10"
					min="1" step="1" /><form:errors path="capdo" />
			</div>
		</div>
		<!-- Email -->
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">Email</span>
				</div>
				<form:input type="email" class="form-control" value="${sessionScope.nhanvien.email}" path="email" /><form:errors path="email" />
			</div>
		</div>
		<!-- SĐT -->
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">Phone Number</span>
				</div>
				<form:input type="text" class="form-control" value="${sessionScope.nhanvien.sdt}" path="sdt" /><form:errors path="sdt" />
			</div>
		</div>
		<!-- Ghi chú -->
		<div class="mt-2 ml-5">
			<div class="input-group col-md-11">
				<div class="input-group-prepend">
					<span class="input-group-text">Note</span>
				</div>
				<textarea class="form-control" name="ghichu" rows="3">${sessionScope.nhanvien.ghichu}</textarea>
			</div>
		</div>
		<c:set var="phongban" value="${sessionScope.Phongban}" />
			<c:if test="${not empty phongban}" />
			<div class="mt-2 ml-5">
				<div class="input-group col-md-11">
					<div class="input-group-prepend">
						<span class="input-group-text">Department ID</span>
					</div>
					<select class="form-control" name="phongban.maphongban" id="cbx" >
					<option selected="selected" value="${sessionScope.nhanvien.phongban.maphongban}">${sessionScope.nhanvien.phongban.tenphongban}</option>
						<c:set var="count" value="0" />
						<c:forEach var="rows" items="${phongban}">
							<c:set var="count" value="${count +1}" />
							<option value="${rows.maphongban}">${rows.tenphongban}</option>
						</c:forEach>
					</select>
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
	var gioitinh = document.getElementById("gt");
	var chon = document.getElementsByName("gioitinh");
	if(gioitinh.value == "1"){
		chon[0].checked = true;
	}
	else if(gioitinh.value == "0"){
		chon[1].checked = true;
	}
</script>
<script type="text/javascript">
var error = "${error}";
var message = "${message}";
if (error!="") {
	swal(error, message, "error");
}
</script>