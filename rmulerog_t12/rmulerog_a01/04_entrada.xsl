<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <table border="1">
                <xsl:apply-templates select="//ciclo/nombre"></xsl:apply-templates>
            </table>
        </html>
    </xsl:template>

    <xsl:template match="nombre">
        <tr>
            <td>
                <xsl:value-of select="."></xsl:value-of>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>