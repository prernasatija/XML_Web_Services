<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>Hotels</h2>
  <table border="1">
      <tr bgcolor="cyan">
      <th align="center" colspan = "9">Hotels</th>
      </tr>
      <tr bgcolor="yellow">
      <th align="center" rowspan = "2">Name</th>
      <th align="center" rowspan = "2">Stars</th>
      <th align="center" colspan = "2" >Contact</th>
      <th align="center"  colspan = "5">Address</th>
     </tr>
      <tr bgcolor = "yellow">   
      <th align="center">Phone</th>
      <th align="center">Email</th>
      <th align="center">Number</th>
      <th align="center">Street</th>
      <th align="center">City</th>
      <th align="center">Zip</th>
      <th align="center">Bus Lines</th>
      </tr>
    <xsl:for-each select="Hotels/Hotel">
    <tr>
      <td><xsl:value-of select="Name" /></td>
      <td><xsl:value-of select="@Stars" /></td>
      <xsl:for-each select="Contact">
      <td><xsl:value-of select="Phone" /></td>
      <td><xsl:value-of select="Email" /></td>
      </xsl:for-each>
      <xsl:for-each select="Address">
      <td><xsl:value-of select="Number" /></td>
      <td><xsl:value-of select="Street" /></td>
      <td><xsl:value-of select="City" /></td>
      <td><xsl:value-of select="Zip" /></td>
      <td><xsl:value-of select="@BusLines" /></td>
      </xsl:for-each>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>