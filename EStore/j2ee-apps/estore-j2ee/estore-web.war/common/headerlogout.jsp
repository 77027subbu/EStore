<jsp:include page="../includes/taglibs.jsp"/>
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
	<dsp:importbean bean="/atg/userprofiling/Profile"/>
	<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
	
	<dsp:form action="<%=request.getRequestURI()%>" method="post">
   			<dsp:input bean="ProfileFormHandler.logoutSuccessURL" type="hidden" value="index.jsp"/>
   			<dsp:input bean="ProfileFormHandler.logoutErrorURL" type="hidden" value="<%=request.getRequestURI()%>"/>
      		<span id="logout">Welcome, 
      			<dsp:droplet name="IsEmpty">
				<dsp:param bean="Profile.nickname" name="value"/>
					<dsp:oparam name="true">
						<a href="registerupdate.jsp"><dsp:valueof bean="Profile.firstName" /></a>
					</dsp:oparam>
									    	
					<dsp:oparam name="false">
		      			<a href="registerupdate.jsp"><dsp:valueof bean="Profile.nickname" /></a>
					</dsp:oparam>									    												
				</dsp:droplet>
      		<dsp:input bean="ProfileFormHandler.logout" type="image" src="img/btn_logout.gif" alt="Logout" id="logoutbutton" value="Logout"/>
      		</span>
      		      		
	</dsp:form>
</dsp:page>
