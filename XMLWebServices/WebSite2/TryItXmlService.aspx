<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    XmlService.Service1Client service = new XmlService.Service1Client();
    protected void transformButton_Click(object sender, EventArgs e)
    {
        htmlFile.Text = service.transformation(xmlUrl.Text, xslUrl.Text);
        System.Diagnostics.Process.Start(htmlFile.Text);
    }

    protected void verifyButton_Click(object sender, EventArgs e)
    {
        verificationMessage.Text = service.verification(Xml.Text, XsdUrl.Text);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div title="Try it Page" style="background-color: #99CCFF; height: 784px;"> <u style="right: 20px; font-style: inherit; font-weight: bold; font-size: medium; font-family: Calibri;">Try it Page for Transformation and Verification Services</u><br />
        <br/><br/>
        <b>Transformation Service:</b> returns an html file as output to xml and xsl urls
        <br /><i>&nbsp;string transformation(string xmlUrl, xslUrl)</i><br /><br />
        &nbsp;Enter Xml file URL <asp:TextBox ID="xmlUrl" runat="server" Width="310px" style="margin-right: 0px; margin-left: 35px;">http://www.public.asu.edu/~psatija1/Hotels.xml</asp:TextBox>
        <br />
        &nbsp;Enter Xsl URL <asp:TextBox ID="xslUrl" runat="server" style="margin-left: 66px" Width="310px">http://www.public.asu.edu/~psatija1/Hotel.xsl</asp:TextBox>
        <br /><br />
        &nbsp;Transform to HTML file <asp:Button ID="transformButton" runat="server" Text="Transform" OnClick="transformButton_Click"  Width="126px" style="margin-left: 68px" />
        <br />
        <br />
        &nbsp;File Path: <asp:Label ID="htmlFile" runat="server" style="margin-left: 80px" Width="208px"></asp:Label>
        <br /><br />
        <br /><br />
        <b>Verification Service:</b> returns error message if xml is invalid for the schema in xsd file
        <br /> <i>&nbsp;string verification(string xmlUrl, string xsdUrl) </i><br /> <br />
        &nbsp;Enter Xml file URL <asp:TextBox ID="Xml" runat="server" Width="274px" style="margin-right: 0px; margin-left: 35px;">http://www.public.asu.edu/~psatija1/Hotels.xml</asp:TextBox>
        <br />
        &nbsp;Enter Xsd file URL <asp:TextBox ID="XsdUrl" runat="server" style="margin-left: 37px" Width="276px">http://www.public.asu.edu/~psatija1/Hotels.xsd</asp:TextBox>
        <br /><br />
        &nbsp;Validate xml&nbsp; <asp:Button ID="verifyButton" runat="server" Text="Verify" OnClick="verifyButton_Click"  Width="126px" style="margin-left: 110px" />
        <br />
        <br />
        &nbsp;Error Message<asp:Label ID="verificationMessage" runat="server" style="margin-left: 100px"></asp:Label>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
