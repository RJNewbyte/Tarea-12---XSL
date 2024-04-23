<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/*">
  <xsl:element name="{name()}">
  <xsl:apply-templates select="museo"/>
  </xsl:element>
</xsl:template>

<xsl:template match="museo">
  <xsl:element name="{name()}">
    <xsl:for-each select="*">
      <xsl:attribute name="{name()}">
        <xsl:value-of select="."/>
      </xsl:attribute>
    </xsl:for-each>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>