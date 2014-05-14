<%!String currPage = "terms";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=iso-889-1" />
		<title>Terms &amp; Conditions</title>
		<jsp:include page="common/pagehead.jsp" />
	</head>

	<body id="polls">
		<div class="pageframe">
			<jsp:include page="common/header.jsp">
				<jsp:param name="currPage" value="<%=currPage%>" />
			</jsp:include>

			<%-- main content --%>
			<div class="maincontent">
				<h2>
					TERMS &amp; CONDITIONS
				</h2>

				<%-- we are putting this first as "skipnav" --%>
				<div id="innerpagenav">
					<ul>
						<li>
							<a href="#link1">Link 1</a>
						</li>
						<li>
							<a href="#link2">Link 2</a>
						</li>
					</ul>
				</div>

				<div class="narrowcontentcolumn">
					<p>
						PLEASE READ THE FOLLOWING TERMS OF USE AND DISCLAIMERS CAREFULLY
						BEFORE USING THIS WEB SITE. By accessing or using this Site, you
						agree to these terms of use, conditions and all applicable laws.
						If you do not agree to these terms you may not use this Site.
					</p>
				</div>
				<div class="clear"></div>
			</div>
			<%-- end main content --%>

			<jsp:include page="common/footer.jsp">
				<jsp:param name="currPage" value="<%=currPage%>" />
			</jsp:include>
		</div>
	</body>
</html>
