<jsp:include page="../includes/taglibs.jsp"/>
<dsp:page>

	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
	<dsp:importbean bean="/atg/userprofiling/Profile"/>
	<dsp:importbean bean="/atg/userprofiling/ProfileErrorMessageForEach"/>
	<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

	<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile" value="false"/>

  	<dsp:droplet name="Switch">
    	<dsp:param bean="Profile.transient" name="value"/>
    	<dsp:oparam name="false">
      		<!-- You are currently logged in. If you wish to login as a different user
      		please logout first.-->
    	</dsp:oparam>

    	<dsp:oparam name="default">
      		<dsp:form action="<%=request.getRequestURI()%>" method="post">
        		<dsp:input bean="ProfileFormHandler.loginSuccessURL" type="hidden" value="/myapp/index.jsp"/>
        		<dsp:input bean="ProfileFormHandler.loginErrorURL" type="hidden" value="<%=request.getRequestURI()%>"/>

        		<dsp:droplet name="Switch">
          			<dsp:param bean="ProfileFormHandler.formError" name="value"/>
          			<dsp:oparam name="true">
            			
            				<ul class="error">
              				<dsp:droplet name="ProfileErrorMessageForEach">
                				<dsp:param bean="ProfileFormHandler.formExceptions" name="exceptions"/>
                				<dsp:oparam name="output">
                					<li><dsp:valueof param="message"/></li>
                  				</dsp:oparam>
              				</dsp:droplet>
            				</ul>
            				
          			</dsp:oparam>
        		</dsp:droplet>
		
		<h2>Login Error</h2>
		<p>Ooops! It seems you entered an invalid email or password. Please try again.</p>
		
		<div class="formframe">
			<fieldset>
				<label for="uname">Email</label>
        		<dsp:input bean="ProfileFormHandler.value.login" id="uname" maxlength="50" size="20" type="text"/>
			</fieldset>
			<fieldset>
				<label for="pass">Password</label>
        		<dsp:input bean="ProfileFormHandler.value.password" id="pass" maxlength="35" size="20" type="password"/>
			</fieldset>
			
				<div class="buttons">
					<dsp:input  bean="ProfileFormHandler.login" type="image" src="img/loginerror_login.gif" alt="Login" title="Login" id="loginbutton" value="Login"/>
				</div>
				<div class="hr"></div>
				<ul>
					<li><dsp:a href="password.jsp">FORGOT YOUR PASSWORD</dsp:a></li>
					<li><dsp:a href="register.jsp">BECOME A MEMBER</dsp:a></li>
				</ul>

			</div>
      		</dsp:form>
    	</dsp:oparam>
    	
  	</dsp:droplet>
</dsp:page>
