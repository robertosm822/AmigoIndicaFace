﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerificarUser.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
<script src="scripts/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
function ShowCurrentTime() {
    $.ajax({
        type: "POST",
        url: "VerificarUser/GetCurrentTime",
        data: '{name: "' + $("#<%=txtUserName.ClientID%>")[0].value + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        failure: function(response) {
            alert(response.d);
        }
    });
}
function OnSuccess(response) {
    alert(response.d);
}
</script> 
</head>
<body style = "font-family:Arial; font-size:10pt">
<form id="form1" runat="server">
<div>
<asp:Label runat="server" ID="txtLabel"></asp:Label>
<br />
Your Name : 
<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
<input id="btnGetTime" type="button" value="Show Current Time" 
    onclick="GetCurrentTime()" />
</div>
</form>
</body>
</html>

