<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-blue-gray w3-animate-left " style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong>${sessionScope.name}</strong></span><br>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h2 class="w3-center">Manager</h2>
  </div>
  <div class="w3-bar-block">
    <a href="${pageContext.request.contextPath}/department" class="w3-bar-item w3-button w3-padding"><i
							class="fas fa-building"></i> Department</a>					
    <a href="${pageContext.request.contextPath}/staff" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Staff</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  Record</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  Statistical</a>
  </div>
</nav>