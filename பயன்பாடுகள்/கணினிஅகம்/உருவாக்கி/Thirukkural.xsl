<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> <head><title>Thirukkural</title></head>
<body>
  <h2>My Thirukkural Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Kural_#</th>
      <th style="text-align:left">Book-Class-Chapter</th>
      <th style="text-align:left">குறள்</th>
      <th style="text-align:left">பொருள்</th>
      <th style="text-align:left">Translation</th>
      <th style="text-align:left">DKE_Kural</th>
      <th style="text-align:left">DKE_Meaning</th>
    </tr>
    <xsl:for-each select="Thirukkural/Kural">
    <tr>
      <td><xsl:value-of select="normalize-space(@number)"/></td>
      <td><xsl:value-of select="Book"/>-<xsl:value-of select="Class"/>-<xsl:value-of select="Chapter"/></td>
      <td><xsl:value-of select="Line1"/> <br/> <xsl:value-of select="Line2"/></td>
      <td><xsl:value-of select="DKT_Meaning"/></td>
      <td><xsl:value-of select="Translation"/></td>
      <td><xsl:value-of select="DKE_Kural"/></td>
      <td><xsl:value-of select="DKE_Meaning"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>