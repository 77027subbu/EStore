<%@ taglib uri="/dspel" prefix="dspel"%>
<dspel:page>
	<dspel:importbean bean="/atg/commerce/ShoppingCart"/>
	<dspel:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
	
	<dspel:include page="../common/formError.jsp">
    	<dspel:param name="formHandler" bean="CartModifierFormHandler"/>
    </dspel:include>
	
	<table>
		<tr><td><b>Shopping Cart</b></td></tr>
	
		<dspel:valueof bean="ShoppingCart.current.id"></dspel:valueof>
		<dspel:form>
			<dspel:droplet name="/atg/dynamo/droplet/ForEach">
				<dspel:param name="array" bean="CartModifierFormHandler.order.commerceItems"/>
				<dspel:param value="commerceItem" name="elementName"/>
				
				<dspel:oparam name="outputStart">
					<tr>
						<td>Remove </td><td>Id   </td><td>quantity   </td><td>Price  </td><td>Total </td>
					</tr>
				</dspel:oparam>
				
				<dspel:oparam name="output">
					<tr>
						<td>
							<c:set var="commerceItemId"><dsp:valueof param="commerceItem.catalogRefId"/></c:set>
							
							<dspel:input type="checkbox" bean="CartModifierFormHandler.removalCommerceIds" value="${commerceItemId}"/>
							
                      	</td>	
						<td><dspel:valueof param="commerceItem.catalogRefId"/></td>
						<td><input type="text" size="3" name="<dspel:valueof param='commerceItem.catalogRefId'/>" value="<dspel:valueof param='commerceItem.quantity'/>"></td>
						<td><dspel:valueof param="commerceItem.priceInfo.listPrice"/></td>
						<td><dspel:valueof param="commerceItem.priceInfo.amount"/></td>
					</tr>
				</dspel:oparam>
				
				<dspel:oparam name="outputEnd">
					<tr><td>Pricing Information</td></tr>
					<tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency">0</dspel:valueof></td></tr>
					<tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.tax" converter="currency">0</dspel:valueof></td></tr>
					<tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.shipping" converter="currency">0</dspel:valueof></td></tr>
					<tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.total" converter="currency">0</dspel:valueof></td></tr>
					
					<%--<tr><td><dspel:input bean="CartModifierFormHandler.setOrderByCommerceId" type="submit" value="Update"/>--%> 
					<tr><td><dspel:input bean="CartModifierFormHandler.moveToPurchaseInfo" type="submit" value="Checkout"/><tr><td>
					
					<dspel:input bean="CartModifierFormHandler.setOrderSuccessURL" type="hidden" value="cart.jsp"/>
					<dspel:input bean="CartModifierFormHandler.setOrderErrorURL" type="hidden" value="cart.jsp"/>
					<dspel:input bean="CartModifierFormHandler.moveToPurchaseInfoSuccessURL" type="hidden" value="shipping.jsp?init=true"/>
					<dspel:input bean="CartModifierFormHandler.moveToPurchaseInfoErrorURL" type="hidden" value="cart.jsp"/>
				</dspel:oparam>
			</dspel:droplet>
		</dspel:form>
		<tr></tr>
	</table>
</dspel:page>