<jsp:include page="../includes/taglibs.jsp"/>
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
	<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/For" />

	<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile"
		value="false" />


	<dsp:droplet name="Switch">
		<dsp:param bean="ProfileFormHandler.profile.transient" name="value" />
		<dsp:oparam name="false">
      		You are currently logged in. If you wish to register as a different user
      		please logout first.
    	</dsp:oparam>


		<dsp:oparam name="default">
			<dsp:form action="<%=request.getRequestURI()%>" name="reginfo"
				formid="reginfo" method="post">

				<dsp:input type="hidden" bean="ProfileFormHandler.confirmPassword"
					value="true" />

				<dsp:input bean="ProfileFormHandler.createSuccessURL" type="hidden"
					value="congrats.jsp" />
				<dsp:input bean="ProfileFormHandler.createErrorURL" type="hidden"
					value="<%=request.getRequestURI()%>" />

				<h2>
					Become a My Application Member.
				</h2>

				<p>
					Enjoy all the benefits of membership with My Application -
					register below.
				</p>
				<p class="note">
					Fields marked with * are required.
				</p>

				<h3>
					Account Information
				</h3>
				<div id="errormsgs" class="error"></div>
				<dsp:droplet name="Switch">
					<dsp:param bean="ProfileFormHandler.formError" name="value" />
					<dsp:oparam name="true">
						<ul class="error">
							<dsp:droplet name="ErrorMessageForEach">
								<dsp:oparam name="output">
									<li>
										<dsp:valueof param="message" />
									</li>
								</dsp:oparam>
							</dsp:droplet>
						</ul>
					</dsp:oparam>
				</dsp:droplet>
				<div class="formframe">
					<fieldset>

						<label for="firstName">
							<span class="hidden">Required </span>First Name *
						</label>

						<dsp:input bean="ProfileFormHandler.value.firstName" name="fname"
							id="firstName" maxlength="30" size="25" type="String"
							required="<%=true%>" />

					</fieldset>
					<fieldset>

						<label for="lastName">
							<span class="hidden">Required </span>Last Name *
						</label>
						<dsp:input bean="ProfileFormHandler.value.lastName" name="lname"
							id="lastName" maxlength="30" size="25" type="String"
							required="<%=true%>" />
						<br />

					</fieldset>
					<fieldset>


						<label for="postalcode">
							Zip *
						</label>
						<dsp:input bean="ProfileFormHandler.value.homeAddress.postalcode"
							name="zip" id="postalcode" maxlength="6" size="10" type="String"
							required="<%=true%>" />

					</fieldset>

					<fieldset class="wide">


						<label for="login">
							<span class="hidden">Required </span>Email Address *
						</label>
						<dsp:input bean="ProfileFormHandler.value.login" name="emailaddy"
							id="login" min="6" maxlength="30" size="25" type="text"
							required="<%=true%>" />

					</fieldset>
					<fieldset>

						<label for="password">
							<span class="hidden">Required </span>Create a Password *
						</label>
						<dsp:input bean="ProfileFormHandler.value.password"
							name="password" id="password" min="6" maxlength="30" size="25"
							type="password" required="<%=true%>" />
						<br />

					</fieldset>
					<fieldset>

						<label for="confirmPassword">
							<span class="hidden">Required </span>Confirm Password *
						</label>
						<dsp:input bean="ProfileFormHandler.value.confirmPassword"
							name="confirmpassword" id="confirmPassword" min="6"
							maxlength="30" size="25" type="password" required="<%=true%>" />

					</fieldset>

					<div class="hr"></div>

					<span> <dsp:input type="checkbox"
							bean="ProfileFormHandler.receiveEmail" id="receiveEmail" /> <label
							for="receiveEmail">
							I would like to receive news and updates from the site.
						</label> </span>

					<div class="hr"></div>
					<div class="buttons">
						<dsp:input value="Sign Up" id="submit" type="image"
							src="img/register_submit_off.jpg" alt="Submit" title="Submit"
							bean="/atg/userprofiling/ProfileFormHandler.create" />
					</div>
				</div>

			</dsp:form>
		</dsp:oparam>
	</dsp:droplet>

	<%-- Generate Javascriipt to highlight fields with errors --%>
	<script type="text/javascript">

var fld;


	<dsp:droplet name="ForEach">
		<dsp:param name="array" bean="ProfileFormHandler.formExceptions"/>
		<dsp:oparam name="output">
			<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
				<dsp:param name="value" param="element.propertyName"/>
				<dsp:oparam name="false">
					fld = document.getElementById("<dsp:valueof param='element.propertyName'/>");
					addClassName (fld, 'errorfield');
				</dsp:oparam>

				<dsp:oparam name="true">
					<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
						<dsp:param name="value" param="element.errorCode"/>
						<dsp:oparam name="false">
							fld = document.getElementById("<dsp:valueof param='element.errorCode'/>");
							addClassName (fld, 'errorfield');
						</dsp:oparam>
					</dsp:droplet>
				</dsp:oparam>

			</dsp:droplet>
		</dsp:oparam>
	</dsp:droplet>

</script>

</dsp:page>
