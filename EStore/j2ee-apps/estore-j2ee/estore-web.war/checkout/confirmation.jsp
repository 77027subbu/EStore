<%@ taglib uri="/dspel" prefix="dspel"%>
<dspel:page>
	<dspel:importbean bean="/atg/commerce/ShoppingCart"/>
	
	<table>
		<tr><td><b>Order Confirmation</b></td></tr>
	
		<tr><td>We appreciate your business with us. 
			Please note down the order number for future references.</td></tr> 
		<tr><td>Order#: <b><dspel:valueof bean="ShoppingCart.last.id"/></b></td></tr>
		<tr><td>Thank you!!!!!! See you soon</td></tr>
	</table>
</dspel:page>