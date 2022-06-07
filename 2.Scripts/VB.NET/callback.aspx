<%@ Page Language="vb" ValidateRequest="false" %>
<%
			Dim storekey As String = "TEST1234"

            Dim sortedList As New SortedList()

            For Each paramName As String In Request.Form.AllKeys
                sortedList.Add(paramName, Request.Form(paramName))
            Next

            Dim hashval As String = ""

            Dim i As Integer
            For i = 0 To sortedList.Count - 1
                Dim lowerKey As String = sortedList.GetKey(i).ToString.ToLower()
                If (Not lowerKey.Equals("hash") And Not lowerKey.Equals("encoding")) Then
                    hashval += WebUtility.HtmlDecode(sortedList.GetByIndex(i).Trim())   + "|"
                End If
            Next i


            
            storekey = storekey.Replace("\", "\\").Replace("|", "\|")
            hashval += storekey

            Dim result As Byte()

            Dim sha As New System.Security.Cryptography.SHA512Managed()

            result = sha.ComputeHash(System.Text.Encoding.UTF8.GetBytes(hashval))
            Dim actualHashValue As String = Convert.ToBase64String(result)

            Dim retrievedHash As String = Request.Form("HASH")
            Dim ProcReturnCode As String = Request.Form("ProcReturnCode")

/*
	During the callback request, the merchant’s web site is supposed to do the following:
		•	Generate a hash code with the same data posted by the CMI platform in the callback request. Then compare this calculated hash with the hash sent by the CMI platform in the callback request. If they are identical, proceed to the next check.
		•	Look, in the orders’ DB of the merchant’s web site, for the record identified by the value of the "oid" parameter sent by the CMI platform in the callback request.
		•	Check if the amount of the order recorded in the orders’ DB of the merchant’s web site is equal to the amount sent by the CMI in the callback request via the "amount" parameter.
		•	Check the "ProcReturnCode" parameter value sent by the CMI in the callback request:
			o	If ProcReturnCode = 00, this is an accepted transaction.
					So it is necessary to update the status of the order in the orders’ DB of the merchant’s web site (status = Paid).
					Answer the CMI callback request with: 
					•	"ACTION=POSTAUTH": in order to debit the client automatically.
					•	"APPROVED": in order to not debit the client automatically. In this case, the merchant needs to manage capture or void manually via CMI Merchant Center interface.
			o	If the ProcReturnCode <> 00 or if ProcReturnCode parameter does not exist in the callback request, it is a payment authorization failure.
					In this case, do not change the status of the order in the BDD orders of the merchant’s web site.
					The response to return to the CMI callback request is "APPROVED" (acknowledgment).
		•	If a technical problem occurs in one of the previous steps, answer the CMI callback request with "FAILURE". In this case, the merchant needs to manage capture or void manually via CMI Merchant Center interface.
*/
            If (Not retrievedHash.Equals(actualHashValue)) Then
				If (Not ProcReturnCode.Equals("00")) Then
					Response.Write("ACTION=POSTAUTH")
				Else
					Response.Write("APPROVED")
				End If
            Else
                Response.Write("FAILURE")
            End If
/*
	The callback request sent by CMI platform to the merchant’s web site in server-to-server mode, reminds as well of the cases of successful transactions as cases of rejections. 
	So it may well be that the merchant’s web site receives, for the same transaction (same order number), rejection returns that will be followed by a return of transaction acceptance. 
	This means that the client has failed attempts before it succeeds. 
	It is the parameter ProcReturnCode which makes possible to distinguish between the callback request of a successful payment authorization (ProcReturnCode = 00) and the callback request of a failed payment (ProcReturnCode! = 00 or nonexistent).
*/
%>