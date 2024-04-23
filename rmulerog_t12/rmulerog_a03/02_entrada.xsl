<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <h1>Ciclos formativos del <xsl:value-of select="/ies/@nombre" /></h1>
      <ul>
        <xsl:apply-templates select="//ciclo" />
      </ul>
    </html>
  </xsl:template>

  <xsl:template match="ciclo">
    <li><xsl:value-of select="@id" /><br/>
      <xsl:value-of select="nombre" />
    </li>
  </xsl:template>

</xsl:stylesheet>