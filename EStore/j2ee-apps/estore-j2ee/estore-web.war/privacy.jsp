<%!String currPage = "privacy";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=iso-889-1" />
		<title>Privacy Statement</title>
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
					PRIVACY POLICY
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
						This statement applies to websites operated by or on behalf of
						<b>My Company.</b>

						<a name="personal"></a>
					<h3 id="personalinfo">
						Personal Information
					</h3>
					<ul>
						<li>
							We collect information you choose to provide such as your email
							or postal address.
						</li>
						<li>
							We collect non-personal information such as browser type,
							operating system, and web pages visited to help manage our
							websites.
						</li>
						<li>
							We use cookies and other internet technologies to manage our
							website and e-mail programs. We do not use these technologies to
							collect or store personal information.
						</li>
						<li>
							We may obtain additional information about you, such as
							demographic information, from commercially available sources.
						</li>

					</ul>

					and so on.....

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
