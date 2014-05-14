<jsp:include page="../includes/taglibs.jsp"/>
<dspel:page>
	<dspel:importbean bean="/atg/commerce/ShoppingCart"/>
	<dspel:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet"/>
	<dspel:importbean bean="/atg/commerce/order/purchase/PaymentGroupFormHandler"/>
	
	<dspel:droplet name="PaymentGroupDroplet">
		<dspel:param value="true" name="clear"/>
		<dspel:param value="creditCard" name="paymentGroupTypes"/>
		<dspel:param value="true" name="initPaymentGroups"/>
		<dspel:param value="true" name="initOrderPayment"/>
		<dspel:oparam name="output"/>
	</dspel:droplet>
	
	<dspel:droplet name="/atg/commerce/order/purchase/RepriceOrderDroplet">
		<dspel:param value="SHIPPING" name="pricingOp"/>
	</dspel:droplet>
	
	<dspel:include page="../common/formError.jsp">
        	<dspel:param name="formHandler" bean="PaymentGroupFormHandler"/>
    </dspel:include>
	
	<table>
		<dspel:form>
		 	<tr><td>Please enter the Billing Address.</td></tr>
		 	<tr><td>CC Type    : <dspel:input bean="PaymentGroupFormHandler.creditCard.creditCardType" name="ccType" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>CC Number  : <dspel:input bean="PaymentGroupFormHandler.creditCard.creditCardNumber" name="ccNumber" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>CVC Number  : <dspel:input bean="PaymentGroupFormHandler.creditCard.cardVerificationNumber" name="ccVerification" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Exp Month  : <dspel:input bean="PaymentGroupFormHandler.creditCard.expirationMonth" name="expMonth" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Exp Year   : <dspel:input bean="PaymentGroupFormHandler.creditCard.expirationYear" name="expYear" maxlength="50" tabindex="1" type="text"/></td></tr>
			<tr><td>-----------------</td></tr>
		 	<tr><td><b>Biling Address</b></td></tr>
			<tr><td>-----------------</td></tr>
		 	<tr><td>First Name : <dspel:input bean="PaymentGroupFormHandler.creditCard.billingAddress.firstName" name="billingFirstName" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Last Name  : <dspel:input bean="PaymentGroupFormHandler.creditCard.billingAddress.lastName" name="billingLastName" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Address1   : <dspel:input bean="PaymentGroupFormHandler.creditCard.billingAddress.address1" name="billingAddress1" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Address2   : <dspel:input bean="PaymentGroupFormHandler.creditCard.billingAddress.address2" name="billingAddress2" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>City       : <dspel:input bean="PaymentGroupFormHandler.creditCard.billingAddress.city" name="billingCity" maxlength="50" tabindex="1" type="text"/> </td></tr>
		 	<tr><td>State      : <dspel:input bean="PaymentGroupFormHandler.creditCard.billingAddress.state" name="billingState" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>ZipCode    : <dspel:input bean="PaymentGroupFormHandler.creditCard.billingAddress.postalcode" name="billingPostalCode" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Country    : <dspel:input bean="PaymentGroupFormHandler.creditCard.billingAddress.country" name="billingPostalCountry" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	
		 	
		 	<dspel:input type="hidden" value="review.jsp" bean="PaymentGroupFormHandler.processBillingSuccessURL"/>
		 	<dspel:input type="hidden" value="billing.jsp" bean="PaymentGroupFormHandler.processBillingErrorURL"/>
		 	<tr><td><dspel:input type="submit" value="Continue" bean="PaymentGroupFormHandler.processBilling"/></td></tr>
		 </dspel:form>
		 
		 <tr><td><b>Price Information</b></td></tr>
		 <tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency">0</dspel:valueof></td></tr>
		 <tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.tax" converter="currency">0</dspel:valueof></td></tr>
		 <tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.shipping" converter="currency">0</dspel:valueof></td></tr>
		 <tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.total" converter="currency">0</dspel:valueof></td></tr>		 
	</table>
	
</dspel:page>