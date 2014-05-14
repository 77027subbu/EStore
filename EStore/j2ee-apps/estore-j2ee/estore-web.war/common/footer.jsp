<jsp:include page="../includes/taglibs.jsp"/>
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/Profile"/>
	<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<% String currPage = request.getParameter("currPage"); 
if (currPage == null || currPage.trim().length() < 1){
	currPage = "noCurrPage";
}
%>
	<div id="footer">
		<ul class="nav">
			<li ><a href="index.jsp" <% if (currPage.equals("home")) { %> class="selected" <% } %>>Home</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
			<li ><a href="page2.jsp" <% if (currPage.equals("page2")) { %> class="selected" <% } %>>Page 2</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>

			<%-- conditional --%>
			<dsp:droplet name="Switch">
				<dsp:param bean="Profile.transient" name="value"/>
		    		<dsp:oparam name="true">
			    		<li ><a href="register.jsp" <% if (currPage.equals("register")) { %> class="selected" <% } %>>Become a Member</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					</dsp:oparam>
		
		    		<dsp:oparam name="default">
		      			<li ><a href="registerupdate.jsp" <% if (currPage.equals("profile")) { %> class="selected" <% } %>>Edit Your Profile</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
		    	</dsp:oparam>
		  	</dsp:droplet>
		  	<li ><a href="sitemap.jsp" <% if (currPage.equals("sitemap")) { %> class="selected" <% } %>>Site Map</a></li>
		</ul>
		<p>&#169; 2008 My Company  <a href="privacy.jsp" <% if (currPage.equals("privacy")) { %> class="selected" <% } %>>Privacy policy</a> | <a href="terms.jsp" <% if (currPage.equals("terms")) { %> class="selected" <% } %>>Terms &amp; Conditions</a> | <a href="mailto:webmast@test.com">Contact Us</a></p>
<div class="clear"></div>
	</div>
</dsp:page>
