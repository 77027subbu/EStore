<%-- formError.jsp
This is the page,we can use if we want to display some errors in the page 
Parameters:
      -  formhandler - A formhandler object that may have exceptions
 --%>
<%@ taglib uri="/dspel" prefix="dspel"%>
<dspel:page>
	<dspel:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
		<dspel:param name="exceptions" param="formhandler.formExceptions"/>
		<dspel:oparam name="outputStart">
			<table><tr><td>Please note the following</td></tr>
		</dspel:oparam>
		<dspel:oparam name="output">
			<tr><td><dspel:valueof param="message" valueishtml="true"/></td></tr>
		</dspel:oparam>
		<dspel:oparam name="outputEnd">
			</table>
		</dspel:oparam>
	</dspel:droplet>
</dspel:page>
