﻿<%@ Page Language="vb" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>3D PAY HOSTING Model</title>
</head>
<body>
    <form method="post" action="https://<host_address>/2.SendData.aspx">
        <%

            Dim orgClientId As String = "100200127"
            Dim orgAmount As String = "91.96"
            Dim orgOkUrl As String = "https://www.nom_de_domaine.com/Ok-Fail.aspx"
            Dim orgFailUrl As String = "https://www.nom_de_domaine.com/Ok-Fail.aspx"
            Dim orgshopurl As String = "https://www.nom_de_domaine.com/Ok-Fail.aspx"
            Dim orgTransactionType As String = "PreAuth"
            Dim orgRnd As String = DateTime.Now.ToString()
            Dim orgCallbackUrl As String = "https://www.nom_de_domaine.com/callback.aspx"
            Dim orgCurrency As String = "504"

        %>

        <center>

     
            <table>            
               <tr>

                    <td align="center" colspan="2">
                        <input type="submit"
                               value="Complete Payment" />
                    </td>
                </tr>


            </table>

            <input type="hidden" name="clientid" value="<%=orgClientId%>" />
            <input type="hidden" name="amount" value="<%=orgAmount%>" />
            <input type="hidden" name="okUrl" value="<%=orgOkUrl%>" />
            <input type="hidden" name="failUrl" value="<%=orgFailUrl%>" />
            <input type="hidden" name="TranType" value="<%=orgTransactionType%>" />
            <input type="hidden" name="callbackUrl" value="<%=orgCallbackUrl%>" />
			<input type="hidden" name="shopurl" value="<%=orgshopurl%>">
            <input type="hidden" name="currency" value="<%=orgCurrency%>" />
            <input type="hidden" name="rnd" value="<%=orgRnd%>" />
            <input type="hidden" name="storetype" value="3D_PAY_HOSTING" />
            <input type="hidden" name="lang" value="fr" />
            <input type="hidden" name="hashAlgorithm" value="ver3" />
            <input type="hidden" name="refreshtime" value="5" />
			<input type="hidden" name="BillToName" value="name">
			<input type="hidden" name="BillToCompany" value="billToCompany">
			<input type="hidden" name="refreshtime" value="5">
			<input type="hidden" name="lang" value="fr">
			<input type="hidden" name="BillToName" value="name">
			<input type="hidden" name="BillToCompany" value="billToCompany">
			<input type="hidden" name="BillToStreet1" value="100 rue adress">
			<input type="hidden" name="BillToCity" value="casablanca">
			<input type="hidden" name="BillToStateProv" value="Maarif Casablanca">
			<input type="hidden" name="BillToPostalCode" value="20230">
			<input type="hidden" name="BillToCountry" value="504">
			<input type="hidden" name="email" value="email@domaine.com">
			<input type="hidden" name="tel" value="0021201020304">
			<input type="hidden" name="encoding" value="UTF-8">
			<input type="hidden" name="oid" value="123ABC"> <!-- La valeur du paramètre oid doit être unique par transaction -->
			
    </form>

    </center>

</body>

</html>


