
<%@page import="org.springframework.ui.ModelMap"%>
<form action="save_pass" method="post">
<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1 style="color: red">Change Password</h1>
		</div>
		<div class="col-md-4"></div>
	</div>
	
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4 input-group mb-3 wrap-input100 validate-input" data-validate = "Curent Password is required">
			<div class="input-group-prepend"></div>
			<input type="password" name="matkhaucu" class="form-control"
				placeholder="Curent Password" value="${passold}"><a style="color: red; font-style: italic;">${mess1}</a>
		</div>
		<div class="col-md-4"></div>
	</div>
	
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4 input-group mb-3 wrap-input100 validate-input" data-validate = "New Password is required">
			<div class="input-group-prepend"></div>
			<input type="password" name="matkhaumoi" class="form-control"
				placeholder="New Password" value="${passnew}"><a style="color: red; font-style: italic;">${mess2}</a>
		</div>
		<div class="col-md-4"></div>
	</div>
	
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4 input-group mb-3 wrap-input100 validate-input" data-validate = "Confirm New Password is required">
			<div class="input-group-prepend"></div>
			<input type="password" name="nhaplai" class="form-control"
				placeholder="Confirm New Password" value="${passconfirm}"><a style="color: red; font-style: italic;">${mess3}</a>
		</div>
		<div class="col-md-4"></div>
	</div>
	
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-2">
			<button type="submit" class="btn btn-outline-primary">Change Password</button>
		</div>
		<div class="col-md-5"></div>
	</div>
</form>
