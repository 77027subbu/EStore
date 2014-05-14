<jsp:include page="../includes/taglibs.jsp"/>

	<dsp:page>
	<dsp:setvalue value="Welcome to My Application" param="messageSubject"/>
	<dsp:setvalue value="contact@text.com" param="messageFrom"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
		<html> 
			<head>
				<title>Welcome!</title>
			<dsp:importbean bean="/atg/userprofiling/Profile"/>
			<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
			<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>


<body bgcolor="#352540" text="#413C42" link="#FFFFFF" alink="#FFFFFF" vlink="#FFFFFF">
<table width="100%" cellspacing="0" cellpadding="0" valign="top">
<tr><td>
	<table align="center" width="552" cellspacing="0" border="1" cellpadding="2" valign="top"><!--  height="676" -->
		<tr>
			<td colspan="2"  style="font: normal 9px verdana; color: #FFFFFF">
				<p>You are receiving this email because you signed up to receive information from mydomain.com. To ensure receipt of our emails, please add "contact@mydomain.com" to your Contacts or Address book.</p>
				<p>If you are having trouble viewing this email, please <a href="javascript:void(0)" style="color: #8C4D8C">click here</a></p>
				
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#5E4273" height="79">{logo}</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#DBD3DE">
				<h2 style="font-family:Verdana,arial,sans-serif;font-size:17px">Welcome to My Application</h2>
			</td>
		</tr>
		<tr>
			<td bgcolor="#DBD3DE" style="font-family:Verdana,arial,sans-serif;font-size:13px">
			<p style="margin-top:20px">
				Your membership to My Application is complete.</p>
				<p>Check back with us often. Each month, we'll be making mydomain.com an even more exciting experience, with more great features and ways for you to connect with the Great Apes.</p>
			</td>	
				<tr>
			<td colspan="2" bgcolor="#DBD3DE">
				<h2 style="font-family:Verdana,arial,sans-serif;font-size:17px; color: #000000">See ya Soon!</h2>
			</td>
		</tr>
			<tr>
			<td colspan="2" bgcolor="#DBD3DE">&nbsp;</td>
			</tr>	
			<tr>
				<td colspan="2" height="49" bgcolor="#B1A5B9">
					<p style="color: #FFFFFFF;font-family:Verdana,arial,sans-serif;font-size: 11px"><a href="#">Unsubscribe</a>&nbsp;|&nbsp;<a href="privacy.jsp">Privacy policy</a>&nbsp;|&nbsp;<a href="terms.jsp">Terms &amp; Conditions</a>&nbsp;|&nbsp;<a href="http://www.mydomain.com">Mydomain.com</a></p>				
				</td>
			</tr>		
			<tr>
				<td colspan="2"  style="font: normal 9px verdana; color: #FFFFFF"><p>&copy; 2008 My Company</p>				
				</td>
			</tr>		
			
		</table>	
	</td>
</tr>
</table>
	</body>
</html>



			<BODY BGCOLOR="#FFFFFF" VLINK="#637DA6" LINK="#E87F02">
				<font face="verdana" size=2>
					<dsp:droplet name="/atg/dynamo/droplet/Switch">
						<dsp:param bean="Profile.firstname" name="value"/>
	  					<dsp:oparam name="unset">
						   		Hi,
					  	</dsp:oparam>
	
		  				<dsp:oparam name="default">
		  						Hi 
    						<dsp:valueof bean="Profile.firstName"/>
    						<dsp:valueof bean="Profile.lastName"/>,
  						</dsp:oparam>
					</dsp:droplet>

					<p>Welcome to mydomain.com.
				</font>
			</body>
		</html>
</dsp:page>