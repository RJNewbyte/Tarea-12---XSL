<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <h1>Ciclos formativos del {/ies/nombre}</h1>
            <xsl:apply-templates select="//ciclo"/>
        </html>
    </xsl:template>

    <xsl:template match="ciclo">
        <p><xsl:value-of select="nombre"/></p>
    </xsl:template>

</xsl:stylesheet>