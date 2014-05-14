<%! String currPage = "error"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=iso-889-1" />
	<title>Error</title>
	<jsp:include page="common/pagehead.jsp" />
	<link rel="stylesheet" href="css/error.css" type="text/css" />
	
	
	<script type="text/javascript">
		window.onload = function()
			{
				Nifty("div.maincontent", "transparent");
				Nifty("div.formframe");
			
			};
	</script>



</head>

<body >
<div class="pageframe">
	<jsp:include page="common/header.jsp" >
   		<jsp:param name="currPage" value="<%=currPage %>" />	
	</jsp:include>

	
	<%-- main content --%>
	<div class="maincontent">
		<jsp:include page="common/loginerror.jsp" />
	</div>
	<%-- end main content --%>
	
	<jsp:include page="common/footer.jsp" />


</div>
<script type="text/javascript">

 if(typeof sIFR == "function"){
    sIFR();
    sIFR.replaceElement("h2", named({sFlashSrc: "flash/sifr_sterling.swf", sColor: "#3A383B", sWmode: "transparent", sBgColor: "#DBD5E2"}));    
    sIFR.replaceElement(".tagline", named({sFlashSrc: "flash/sifr_chalet.swf", sColor: "#FFFFFF", sBgColor: "#12101E"}));
 };



</script>

</body>
</html>

 