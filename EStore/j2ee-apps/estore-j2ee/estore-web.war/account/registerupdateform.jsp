<jsp:include page="../includes/taglibs.jsp"/>
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/For" />

	<dsp:droplet name="Switch">
		<dsp:param bean="Profile.transient" name="value" />
		<dsp:oparam name="true">
			<dsp:droplet name="/atg/dynamo/droplet/Redirect">
				<dsp:param name="url" value="../index.jsp" />
			</dsp:droplet>
		</dsp:oparam>
	</dsp:droplet>

	<dsp:setvalue bean="ProfileFormHandler.extractDefaultValuesFromProfile"
		value="true" />

	<h2>
		Account Preferences
	</h2>
	<p>
		This is your place to make changes and additions to your account.
	</p>

	<h3>
		Update Information
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
		<dsp:form action="<%=request.getRequestURI()%>" method="post"
			formid="profileinfo">
			<dsp:input bean="ProfileFormHandler.confirmPassword" type="hidden"
				value="false" />
			<dsp:input value="/myapp/index.jsp" type="hidden"
				bean="/atg/userprofiling/ProfileFormHandler.updateSuccessURL" />
			<dsp:input value="<%=request.getRequestURI()%>" type="hidden"
				bean="/atg/userprofiling/ProfileFormHandler.updateErrorURL" />


			<!-- Default form error handling support -->
			<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
				<dsp:oparam name="output">
					<b><dsp:valueof param="message" /> </b>
					<br>
				</dsp:oparam>
			</dsp:droplet>

			<fieldset>

				<label for="fname">
					First Name
				</label>
				<dsp:input bean="ProfileFormHandler.value.firstName" id="fname"
					maxlength="30" size="25" type="text" required="<%=true%>" />
				<br />
			</fieldset>
			<fieldset>
				<label for="lname">
					Last Name
				</label>
				<dsp:input bean="ProfileFormHandler.value.lastName" id="lname"
					maxlength="30" size="25" type="text" required="<%=true%>" />
				<br />
			</fieldset>

			<fieldset class="wide">
				<label for="emailaddy">
					Email Address
				</label>
				<dsp:input bean="ProfileFormHandler.value.login" name="emailaddy"
					id="emailaddy" maxlength="50" size="50" type="text"
					required="<%=true%>" />
			</fieldset>

			<fieldset>
				<label for="zip">
					Zip
				</label>
				<dsp:input bean="ProfileFormHandler.value.homeAddress.postalcode"
					id="zip" maxlength="30" size="25" type="text" />
			</fieldset>



			<div class="hr"></div>

			<span> <dsp:input type="checkbox"
					bean="ProfileFormHandler.receiveEmail" id="recieveEmail" /> <label
					for="receiveEmail">
					I would like to receive news and updates from My Application.
				</label> </span>
			<div class="hr"></div>
			<div class="buttons">
				<input type="image" src="img/register_cancel_off.jpg" value="Cancel" />
				<dsp:input value="Update" type="image"
					src="img/register_update_off.jpg" alt="Update" title="Update"
					bean="/atg/userprofiling/ProfileFormHandler.update" />
			</div>
		</dsp:form>
	</div>

	<div class="clear"></div>

	<h3>
		Update Password
	</h3>
	<div class="formframe">
		<dsp:form action="<%=request.getRequestURI()%>" method="post"
			formid="changepassword">
			<dsp:input
				bean="/atg/userprofiling/ProfileFormHandler.changePasswordSuccessURL"
				value="/myapp/index.jsp" type="hidden" />
			<dsp:input
				bean="/atg/userprofiling/ProfileFormHandler.changePasswordErrorURL"
				value="<%=request.getRequestURI()%>" type="hidden" />
			<dsp:input bean="ProfileFormHandler.confirmPassword" type="hidden"
				value="true" />

			<fieldset>
				<label for="opass">
					Old Password
				</label>
				<dsp:input bean="ProfileFormHandler.value.oldPassword" id="opass"
					maxsize="10" size="35" type="password" value="" />
			</fieldset>
			<fieldset>

				<label for="npass">
					New Password
				</label>
				<dsp:input bean="ProfileFormHandler.value.password" id="npass"
					min="6" maxsize="10" size="35" type="password" value="" />
			</fieldset>
			<fieldset>


				<label for="confirmpass">
					Confirm Password
				</label>
				<dsp:input bean="ProfileFormHandler.value.confirmPassword" min="6"
					id="confirmpass" maxsize="10" size="35" type="password" value="" />
			</fieldset>

			<div class="buttons">
				<dsp:input bean="ProfileFormHandler.changePassword" id="submit"
					type="image" src="img/register_update_off.jpg" alt="Update"
					title="Update" value="Save New Password" />
			</div>
		</dsp:form>
	</div>

</dsp:page>
