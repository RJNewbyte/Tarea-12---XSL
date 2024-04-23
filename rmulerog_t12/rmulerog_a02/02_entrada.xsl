<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <h1><xsl:value-of select="/ies/@nombre"/></h1>
            <p>Página Web: <a href="{/ies/@web}"><xsl:value-of select="/ies/@web"/></a></p>
            <ul>
                <xsl:apply-templates select="//ciclo"/>
            </ul>
        </html>
    </xsl:template>

    <xsl:template match="ciclo">
        <li><xsl:value-of select="nombre"/></li>
    </xsl:template>

</xsl:stylesheet>