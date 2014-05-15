<jsp:include page="includes/taglibs.jsp"/>
<dsp:page>
	<%!String currPage = "home";%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
		<head>
			<meta http-equiv="content-type"
				content="text/html; charset=iso-889-1" />
			<title>My Application</title>
			<jsp:include page="common/pagehead.jsp" />
		</head>

		<body id="home">
			<div class="pageframe">
				<jsp:include page="common/header.jsp">
					<jsp:param name="currPage" value="<%=currPage%>" />
				</jsp:include>



				<%-- main content --%>
				<div class="maincontent">

					<div style="float: left">
						<h2>
							Stuff
						</h2>
						<p>
							Info on stufff
						</p>
					</div>
				</div>

				<jsp:include page="common/footer.jsp">
					<jsp:param name="currPage" value="<%=currPage%>" />
				</jsp:include>
			</div>
		</body>
	</html>
</dsp:page>
