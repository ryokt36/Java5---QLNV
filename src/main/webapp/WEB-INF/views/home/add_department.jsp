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
			<form:input type="text" path="tenphongban" class="form-control"
				placeholder="Department Name" />
		</div>
		<div class="col-md-4"></div>
	</div>
	<form:errors path="tenphongban" />
	<br/>
		<button type="submit" class="btn btn-outline-primary">Add</button>
	<div class="col-md-2"></div>
</form:form>
