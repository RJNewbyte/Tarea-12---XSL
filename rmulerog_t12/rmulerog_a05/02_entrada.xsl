<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/*">
<xsl:element name="museos">
    <xsl:apply-templates select="museo"></xsl:apply-templates>
</xsl:element>
</xsl:template>

<xsl:template match="museo">
    <xsl:element name="museo">
        <xsl:attribute name="ubicacion"><xsl:value-of select="concat(@ciudad, ' (', @pais, ')' )"></xsl:value-of></xsl:attribute>
        <xsl:value-of select="@nombre"></xsl:value-of>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>