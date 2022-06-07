<%@ Page Language="C#" ValidateRequest="false" %>
<%
			String storeKey = "TEST1234";
			
			
			
			
            List<KeyValuePair<String, String>> postParams = new List<KeyValuePair<String, String>>();
            foreach (string key in Request.Form.AllKeys)
            {
                KeyValuePair<String, String> newKeyValuePair = new KeyValuePair<String, String>(key, Request.Form[key]);
                postParams.Add(newKeyValuePair);
            }

            postParams.Sort(
                delegate (KeyValuePair<string, string> firstPair,
                KeyValuePair<string, string> nextPair)
                {
                    return firstPair.Key.CompareTo(nextPair.Key.ToLower(new System.Globalization.CultureInfo("en-US", false)));
                }
            );

            String hashVal = "";
            

            foreach (KeyValuePair<String, String> pair in postParams)
            {
                String escapedValue = pair.Value.Replace("\\", "\\\\").Replace("|", "\\|");
                String lowerValue = pair.Key.ToLower(new System.Globalization.CultureInfo("en-US", false));
                if (!"encoding".Equals(lowerValue) && !"hash".Equals(lowerValue))
                {
                    hashVal += HttpUtility.HtmlDecode(escapedValue).Trim() + "|";
                }
            }
            hashVal += storeKey;

            System.Security.Cryptography.SHA512 sha = new System.Security.Cryptography.SHA512CryptoServiceProvider();
            byte[] hashbytes = System.Text.Encoding.GetEncoding("UTF-8").GetBytes(hashVal);
            byte[] inputbytes = sha.ComputeHash(hashbytes);
            String actualHash = System.Convert.ToBase64String(inputbytes);

            String retrievedHash = Request.Form["HASH"];
            String procReturnCode = Request.Form["ProcReturnCode"];
			
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
            if (!actualHash.Equals(retrievedHash))
            {
				if (!procReturnCode.Equals("00"))
				{
					Response.Write(ACTION=POSTAUTH);
				}
				else
				{
					Response.Write(APPROVED);
				}		
            }
            else
            {
                Response.Write(FAILURE);
            }
/*
	The callback request sent by CMI platform to the merchant’s web site in server-to-server mode, reminds as well of the cases of successful transactions as cases of rejections. 
	So it may well be that the merchant’s web site receives, for the same transaction (same order number), rejection returns that will be followed by a return of transaction acceptance. 
	This means that the client has failed attempts before it succeeds. 
	It is the parameter ProcReturnCode which makes possible to distinguish between the callback request of a successful payment authorization (ProcReturnCode = 00) and the callback request of a failed payment (ProcReturnCode! = 00 or nonexistent).
*/
%>