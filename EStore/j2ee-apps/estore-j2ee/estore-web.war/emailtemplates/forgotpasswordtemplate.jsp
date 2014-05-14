<jsp:include page="../includes/taglibs.jsp"/>
	<dsp:page>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
		<html> 
			<head>
				<title>Forgot Your Password</title>
				</head>
			<dsp:importbean bean="/atg/userprofiling/Profile"/>
			<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
			<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<body bgcolor="#352540" text="#413C42" link="#FFFFFF" alink="#FFFFFF" vlink="#FFFFFF" >
<table width="100%" cellspacing="0" cellpadding="0" valign="top">
<tr><td>
	<table align="center" width="552" cellspacing="0" border="1" cellpadding="2" valign="top"><!--  height="676" -->
		<tr>
			<td colspan="2"  style="font: normal 9px verdana; color: #FFFFFF">
				<p>You are receiving this email because you signed up to receive information from My Application. To ensure receipt of our emails, please add "contact@test.com" to your Contacts or Address book.</p>
				<p>If you are having trouble viewing this email, please <a href="javascript:void(0)" style="color: #8C4D8C">click here</a></p>
				
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#5E4273" height="79">{logo}</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#DBD3DE">
				<h2 style="font-family:Verdana,arial,sans-serif;font-size:17px">Your New Password</h2>
			</td>
		</tr>
		<tr>
			<td bgcolor="#DBD3DE" style="font-family:Verdana,arial,sans-serif;font-size:13px">
			<p style="margin-top:20px">
				Thank you for requesting your My Application membership password.</p>
				<p>We have reassigned your password -- you'll find it below. Please use it to log on to your My Application Preferences, and reset your password to something that's easy to remember. 			</p>
				<p>Your password is: <dsp:valueof param="newpassword"/></p>
			</td>
			<td rowspan="2" bgcolor="#DBD3DE" width="150px">award</td>
			</tr>
			<tr>
				<td  bgcolor="#DBD3DE"><input type="submit" value="Take me to My Application" /></td>
			</tr>	
			<tr>
			<td colspan="2" bgcolor="#DBD3DE">&nbsp;</td>
			</tr>	
			<tr>
				<td colspan="2" height="49" bgcolor="#B1A5B9">
					<p style="color: #FFFFFFF;font-family:Verdana,arial,sans-serif;font-size: 11px"><a href="#">Unsubscribe</a>&nbsp;|&nbsp;<a href="privacy.jsp">Privacy policy</a>&nbsp;|&nbsp;<a href="terms.jsp">Terms &amp; Conditions</a>&nbsp;|&nbsp;<a href="http://www.mydomain.com">mydomain.com</a></p>				
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

</dsp:page>