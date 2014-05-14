<jsp:include page="../includes/taglibs.jsp"/>

<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
	<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
	<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

	<dsp:form action="<%=request.getRequestURI()%>" method="post" name="forgotpassfrm" formid="forgotpassfrm" onsubmit="return echeck(forgotpassfrm.emailaddy.value);">
        <dsp:input bean="ProfileFormHandler.successURL" type="hidden" value="/myapp/index.jsp" />
        <dsp:input bean="ProfileFormHandler.errorURL" type="hidden" value="<%=request.getRequestURI()%>" />

        <dsp:droplet name="Switch">
          <dsp:param bean="ProfileFormHandler.formError" name="value"/>
          <dsp:oparam name="true">
            <ul class="error">
              <dsp:droplet name="ErrorMessageForEach">
                <dsp:oparam name="output">
                  <li><dsp:valueof param="message"/>
                </dsp:oparam>
              </dsp:droplet>
            </ul>
          </dsp:oparam>
        </dsp:droplet>

		<h2>Forgot Password</h2>
		<p>Everyone forgets their passwords now and then. Enter the email address you used to create your account, and we'll send your password reminder to you right away.</p>
		
		<div class="formframe">
		<fieldset>
			<label for="emailaddy"><img src="img/forgotPW_email.gif" alt="Email Address" title="Email Address" /></label>
			<dsp:input bean="ProfileFormHandler.value.login" id="emailaddy" maxlength="30" size="25" type="text" required="<%=true%>"/>
			<span class="buttons">
				<dsp:input value="Forgot Password" type="image" src="img/forgotPW_submit.gif" alt="Submit" title="Submit" bean="ProfileFormHandler.forgotPassword" />
			</span>
		</fieldset>

			<div class="clear"></div>
		</div>
	</dsp:form>

</dsp:page>
