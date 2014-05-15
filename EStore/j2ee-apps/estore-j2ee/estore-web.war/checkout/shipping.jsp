<%@ taglib uri="/dspel" prefix="dspel"%>
<dspel:page>
	<dspel:importbean bean="/atg/commerce/ShoppingCart"/>
	<dspel:importbean bean="/atg/commerce/order/purchase/ShippingGroupDroplet"/>
	<dspel:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>
		
	<dspel:include page="../common/formError.jsp">
        	<dspel:param name="formHandler" bean="ShippingGroupFormHandler"/>
    </dspel:include>
	
	<table>
		<tr><td><b>Shipping</b></td></tr>
		
		<dspel:getvalueof var="init" param="init"/> 
  			
  		<c:if test='${init == "true"}'>
			<dspel:droplet name="ShippingGroupDroplet">
		      <dspel:param name="clearShippingInfos" param="init"/>
		      <dspel:param name="clearShippingGroups" param="init"/>
		      <dspel:param name="shippingGroupTypes" value="hardgoodShippingGroup"/>
		      <dspel:param name="initShippingGroups" param="init"/>
		      <dspel:param name="initBasedOnOrder" param="init"/>
		      <dspel:oparam name="output">
		      </dspel:oparam>
		    </dspel:droplet>
		 </c:if>
		 
		 
		 <dspel:form>
		 
		 	<tr><td>Please enter the shipping Address.</td></tr>
		 	<tr><td>First Name : <dspel:input bean="ShippingGroupFormHandler.shippingAddress.firstName" name="shippingFirstName" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Last Name  : <dspel:input bean="ShippingGroupFormHandler.shippingAddress.lastName" name="shippingLastName" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Address1   : <dspel:input bean="ShippingGroupFormHandler.shippingAddress.address1" name="shippingAddress1" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Address2   : <dspel:input bean="ShippingGroupFormHandler.shippingAddress.address2" name="shippingAddress2" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>City       : <dspel:input bean="ShippingGroupFormHandler.shippingAddress.city" name="shippingCity" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>State      : <dspel:input bean="ShippingGroupFormHandler.shippingAddress.state" name="shippingState" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>ZipCode    : <dspel:input bean="ShippingGroupFormHandler.shippingAddress.postalcode" name="shippingPostalCode" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	<tr><td>Country    : <dspel:input bean="ShippingGroupFormHandler.shippingAddress.country" name="shippingPostalCountry" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	
		 	<tr><td>Please select a shipping method:

		 	
		 	<dspel:input bean="ShippingGroupFormHandler.shippingMethod" value="free" name="shippingMethod" maxlength="50" tabindex="1" type="text"/></td></tr>
		 	
		 	<dspel:input type="hidden" value="billing.jsp" bean="ShippingGroupFormHandler.processShippingSuccessURL"/>
		 	<dspel:input type="hidden" value="shipping.jsp" bean="ShippingGroupFormHandler.processShippingErrorURL"/>
		 	<tr><td><dspel:input type="submit" value="Continue" bean="ShippingGroupFormHandler.processShipping"/></td></tr>
		 </dspel:form>
		 
		 
		 <tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency">0</dspel:valueof></td></tr>
		 <tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.tax" converter="currency">0</dspel:valueof></td></tr>
		 <tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.shipping" converter="currency">0</dspel:valueof></td></tr>
		 <tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.total" converter="currency">0</dspel:valueof></td></tr>
		 
	</table>
</dspel:page>