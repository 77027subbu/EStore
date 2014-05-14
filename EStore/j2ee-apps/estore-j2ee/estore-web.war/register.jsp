<%!String currPage = "register";%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=iso-889-1" />
		<title>Become a Member</title>
		<jsp:include page="common/pagehead.jsp" />
		<link rel="stylesheet" href="css/register.css" type="text/css" />
	</head>

	<body>
		<div class="pageframe">
			<jsp:include page="common/header.jsp">
				<jsp:param name="currPage" value="<%=currPage%>" />
			</jsp:include>

			<%-- main content --%>
			<div class="maincontent">
				<jsp:include page="account/registerform.jsp" />
				<div class="clear"></div>
			</div>

			<%-- end main content --%>

			<jsp:include page="common/footer.jsp">
				<jsp:param name="currPage" value="<%=currPage%>" />
			</jsp:include>
		</div>
	</body>
</html>
