<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
    <xsl:apply-templates select="//ciclo/nombre"></xsl:apply-templates>
</html>
</xsl:template>

<xsl:template match="nombre">
<p><xsl:value-of select="."></xsl:value-of></p>
</xsl:template>

</xsl:stylesheet>