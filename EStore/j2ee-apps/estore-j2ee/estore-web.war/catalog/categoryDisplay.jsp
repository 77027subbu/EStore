<jsp:include page="../includes/taglibs.jsp"/>
<dspel:page>
	This page displays the category properties.
	
	<dspel:droplet name="/atg/commerce/catalog/CategoryLookup">
	  <dspel:param param="categoryId" name="id"/>
	  <dspel:param value="category" name="elementName"/>
	  <dspel:oparam name="output">  
	  		<br><b><dspel:valueof param="category.displayName"/></b>
	  		
	  		<dspel:droplet name="/atg/dynamo/droplet/ForEach">
				<dspel:param name="array" param="category.fixedChildCategories"/>
				<dspel:param value="childCategory" name="elementName"/>
				<dspel:oparam name="outputStart">
					<br>Sub Categories(Total: <dspel:valueof param="count"/>)
				</dspel:oparam>
				<dspel:oparam name="output">					
					<br><dspel:a href="categoryDisplay.jsp">
							<dspel:valueof param="childCategory.displayName"/>
							<dspel:param name="categoryId" param="childCategory.id"/>
						</dspel:a>
				</dspel:oparam>
			</dspel:droplet>
	   	
	   		<dspel:droplet name="/atg/dynamo/droplet/ForEach">
				<dspel:param name="array" param="category.fixedChildProducts"/>
				<dspel:param value="childProduct" name="elementName"/>
				<dspel:oparam name="outputStart">
					<br>Products(Total: <dspel:valueof param="count"/>)
				</dspel:oparam> 
				<dspel:oparam name="output">				
					<br><dspel:a href="productDisplay.jsp">
						<dspel:valueof param="childProduct.displayName"/>
						<dspel:param name="productId" param="childProduct.id"/>
					</dspel:a>
				</dspel:oparam>
			</dspel:droplet>	
		
				
	  </dspel:oparam>
	</dspel:droplet>

	
</dspel:page>