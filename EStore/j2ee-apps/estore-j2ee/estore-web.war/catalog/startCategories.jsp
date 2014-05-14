<jsp:include page="../includes/taglibs.jsp"/>
<dspel:page>
	<dspel:droplet name="/atg/dynamo/droplet/ForEach">
   		<dspel:param bean="/atg/userprofiling/Profile.catalog.allRootCategories"
        name="array"/>
  		<dspel:oparam name="output">
			<br>
			<dspel:a href="categoryDisplay.jsp">
    			<dspel:valueof param="element.displayName"/>
    			<dspel:param param="element.repositoryId"  name="categoryId"/>
    		</dspel:a>
  		</dspel:oparam>
	</dspel:droplet>
</dspel:page>