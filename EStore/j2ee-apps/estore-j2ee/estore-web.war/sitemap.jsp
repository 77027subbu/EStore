<jsp:include page="includes/taglibs.jsp"/>
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />

	<%!String currPage = "sitemap";%>

	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
		<head>
			<meta http-equiv="content-type"
				content="text/html; charset=iso-889-1" />
			<title>SiteMap</title>
			<jsp:include page="common/pagehead.jsp" />
			<link rel="stylesheet" type="text/css" href="css/sitemap.css" />
		</head>

		<body>
			<div class="pageframe">
				<jsp:include page="common/header.jsp">
					<jsp:param name="currPage" value="<%=currPage%>" />
				</jsp:include>

				<%-- main content --%>
				<div class="mainsitemap">
					<h2>
						<img src="img/siteMap_hdr.jpg" alt="Site Map" />
					</h2>
					<div class="col withright">
						<ul>
							<li>
								<a href="index.jsp">Home</a>
							</li>
							<li>
								<a href="page2.jsp">Page 2</a>
							</li>
						</ul>
					</div>

					<div class="col withleft">
						<ul>
							<%-- conditional --%>
							<dsp:droplet name="Switch">
								<dsp:param bean="Profile.transient" name="value" />
								<dsp:oparam name="true">
									<li>
										<a href="register.jsp">Become a Member</a>
										<ul>
											<li>
												<a href="privacy.jsp"></a>
											</li>
										</ul>
									</li>
								</dsp:oparam>

								<dsp:oparam name="default">
									<li>
										<a href="registerupdate.jsp">Edit Your Preferences</a>
									</li>
								</dsp:oparam>
							</dsp:droplet>
							<li>
								<a href="privacy.jsp">Privacy Policy</a>
							</li>
							<li>
								<a href="terms.jsp">Terms &amp; Conditions</a>
							</li>
						</ul>
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
</dsp:page>
