<jsp:include page="../includes/taglibs.jsp"/>
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
	<dsp:importbean bean="/atg/userprofiling/Profile"/>
	<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
	<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

  	<dsp:droplet name="Switch">
    	<dsp:param bean="Profile.transient" name="value"/>
    	<dsp:oparam name="false">
      		<!-- You are currently logged in. If you wish to login as a different user
      		please logout first.-->
    	</dsp:oparam>

    	<dsp:oparam name="default">
      		<dsp:form action="<%=request.getRequestURI()%>" method="post">
        		<dsp:input bean="ProfileFormHandler.loginSuccessURL" type="hidden" value="<%=request.getRequestURI()%>" />
        		<dsp:input bean="ProfileFormHandler.loginErrorURL" type="hidden" value="/myapp/error.jsp"/>
		
			<fieldset>
				<label for="uname">Email</label>
        		<dsp:input bean="ProfileFormHandler.value.login" id="uname" maxlength="50" type="text"/>
				<a href="password.jsp">Forgot Password?</a>
			</fieldset>
			<fieldset>
				<label for="pass">Password</label>
        		<dsp:input bean="ProfileFormHandler.value.password" id="pass" maxlength="35" type="password"/>
				<dsp:input bean="ProfileFormHandler.login" type="image" src="img/btn_login.gif" alt="Login" id="loginbutton" value="Login"/>

			</fieldset>
      		</dsp:form>
    	</dsp:oparam>
  	</dsp:droplet>
</dsp:page>
