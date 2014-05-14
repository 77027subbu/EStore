<jsp:include page="../includes/taglibs.jsp"/>
<dspel:page>
	<dspel:importbean var="originatingRequest" bean="/OriginatingRequest" scope="request"/>
	<dspel:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
	
	<dspel:include page="../common/formError.jsp">
    	<dspel:param name="formHandler" bean="CartModifierFormHandler"/>
    </dspel:include>
	
	<dspel:droplet name="/atg/commerce/catalog/ProductLookup">
	  <dspel:param param="productId" name="id"/>
	  <dspel:param value="product" name="elementName"/>
	  <dspel:oparam name="output">  
	  		<br><b><dspel:valueof param="product.displayName"/></b>	  		
	  		
	  		<dspel:droplet name="/atg/dynamo/droplet/ForEach">
				<dspel:param name="array" param="product.childSKUs"/>
				<dspel:param value="childSKU" name="elementName"/>
				<dspel:oparam name="output">	
					<dspel:form>				
						SKU id: <dspel:valueof param="childSKU.id"/>
						<dspel:input bean="CartModifierFormHandler.catalogRefIds"  paramvalue="childSKU.repositoryId" type="hidden" /> 
						<dspel:input bean="CartModifierFormHandler.productId" paramvalue="product.repositoryId" type="hidden" />
						<br>Quantity: <dspel:input bean="CartModifierFormHandler.quantity" value="1" type="text" />
						<br><dspel:input bean="CartModifierFormHandler.addItemToOrder" type="submit" value="Add To Cart" />
						<c:set var="errorUrl" value="productDisplay.jsp?productId=${param.productId}"/>
						<dspel:input bean="CartModifierFormHandler.addItemToOrderSuccessURL" value="../checkout/cart.jsp" type="hidden"/>
						<dspel:input bean="CartModifierFormHandler.addItemToOrderErrorURL" value="${errorUrl}" type="hidden"/>
						
					</dspel:form>
				</dspel:oparam>
			</dspel:droplet>
	  </dspel:oparam>
	</dspel:droplet>
</dspel:page>