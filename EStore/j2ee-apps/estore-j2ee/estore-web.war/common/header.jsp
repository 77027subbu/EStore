<jsp:include page="../includes/taglibs.jsp"/>
<% String currPage = request.getParameter("currPage"); 
if (currPage == null || currPage.trim().length() < 1){
	currPage = "noCurrPage";
}
%>

<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
	<dsp:importbean bean="/atg/userprofiling/Profile"/>
	<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
	<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

	<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile" value="false"/>

	<div id="header">
		<h1><a href="/myapp/index.jsp"><img src="img/my_logo.gif" alt="My Company" /></a></h1>

		<div id="accountinfo">
		<dsp:droplet name="Switch">
			<dsp:param bean="Profile.transient" name="value"/>
    		<dsp:oparam name="true">
	      		<jsp:include page="headerlogin.jsp" /> 
			</dsp:oparam>

    		<dsp:oparam name="default">
      			<jsp:include page="headerlogout.jsp" />
    		</dsp:oparam>
  		</dsp:droplet>
		</div>
		
		<span class="tagline">My Company Tagline.</span>
		
		<ul id="topnav" class="nav">
		<% if (currPage.equals("home")) { %>
			<li class="selected"><img class="imglink" src="img/nav_Home_on.gif" alt="Home" /></li>
		<% } else { %>
			<li><a href="index.jsp"><img class="imglink" src="img/nav_Home_off.gif" alt="Home" /></a></li>
		<% } %>
		<% if (currPage.equals("page2")) { %>
			<li class="selected"><img class="imglink" src="img/nav_Page2_on.gif" alt="Page 2" /></li>
		<% } else { %>
			<li><a href="page2.jsp"><img class="imglink" src="img/nav_Page2_off.gif" alt="Page 2" /></a></li>
		<% } %>
		
			<%-- conditional --%>
			<dsp:droplet name="Switch">
			<dsp:param bean="Profile.transient" name="value"/>
    		<dsp:oparam name="true">
   				<% if (currPage.equals("register")) { %>
					<li class="selected"><img class="imglink" src="img/nav_BecomeMem_on.gif" alt="Become a Member" /></li>
				<% } else { %>
					<li><a href="register.jsp"><img class="imglink" src="img/nav_BecomeMem_off.gif" alt="Become a Member" /></a></li>
				<% } %>
			</dsp:oparam>

    		<dsp:oparam name="default">
      			<% if (currPage.equals("profile")) { %>
					<li class="selected"><img class="imglink" src="img/nav_EditPrefs_on.gif" alt="Edit your Profile" /></li>
				<% } else { %>
					<li><a href="registerupdate.jsp"><img class="imglink" src="img/nav_EditPrefs_off.gif" alt="Edit your Profile" /></a></li>
				<% } %>
    		</dsp:oparam>
  		</dsp:droplet>
		</ul>
		<div class="clear"></div>
	</div>
</dsp:page>
