<%! String currPage = "error"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=iso-889-1" />
	<title>Error</title>
	<jsp:include page="common/pagehead.jsp" />
	
	
	<script type="text/javascript">
		window.onload = function()
			{
				Nifty("div.maincontent");
			};
	</script>



</head>

<body >
<div class="pageframe">
	<jsp:include page="common/header.jsp" >
   		<jsp:param name="currPage" value="<%=currPage %>" />	
	</jsp:include>

	
	<%-- main content --%>
	<div class="maincontent">
		<jsp:include page="common/loginerror.jsp" />
	</div>
	<%-- end main content --%>
	
	<jsp:include page="common/footer.jsp" />


</div>

</body>
</html>

 