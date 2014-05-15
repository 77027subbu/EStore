<%@ taglib uri="/dspel" prefix="dspel"%>
<dspel:page>
	<dspel:importbean bean="/atg/commerce/order/purchase/CommitOrderFormHandler"/>
	<dspel:importbean bean="/atg/commerce/ShoppingCart"/>
	
	<table>
		<tr><td><b>Review</b></td></tr>
	
		<dspel:include page="../common/formError.jsp">
        	<dspel:param name="formHandler" bean="CommitOrderFormHandler"/>
        </dspel:include>

		<tr><td><dspel:valueof bean="ShoppingCart.current.id"/></td></tr>
		
		<tr><td><b>Price Information</b></td></tr>
		<tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency">0</dspel:valueof></td></tr>
		<tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.tax" converter="currency">0</dspel:valueof></td></tr>
		<tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.shipping" converter="currency">0</dspel:valueof></td></tr>
		<tr><td><dspel:valueof bean="ShoppingCart.current.priceInfo.total" converter="currency">0</dspel:valueof></td></tr>
		
		<dspel:form>
			<tr><td><dspel:input type="submit" bean="CommitOrderFormHandler.commitOrder" value="Confirm Order"/></td></tr>
			
			<dspel:input type="hidden" value="confirmation.jsp" bean="CommitOrderFormHandler.commitOrderSuccessURL"/>
			<dspel:input type="hidden" value="review.jsp" bean="CommitOrderFormHandler.commitOrderErrorURL"/>
			 	
		</dspel:form>
	</table>
</dspel:page>