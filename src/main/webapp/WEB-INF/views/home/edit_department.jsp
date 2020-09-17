<meta charset="utf-8">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
<form:form class="w3-center" action="save_department"
	modelAttribute="phongban" method="post">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4" style="width: 500px;">
			<input type="text" name="maphongban" value="${sessionScope.maphongban}" readonly="readonly" />
			<form:input type="text" path="tenphongban" class="form-control" value="${sessionScope.tenphongban}"
				placeholder="Department Name" />
		</div>
		<div class="col-md-4"></div>
	</div>
	<form:errors path="tenphongban" />
	<br/>
		<button type="submit" class="btn btn-outline-primary">Save</button>
	<div class="col-md-2"></div>
</form:form>