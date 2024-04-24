<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/*">
        <html>
            <head>
                <meta charset="UTF-8"></meta>
                <title>Tabla de artistas</title>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Año de nacimiento</th>
                        <th>Año de fallecimiento</th>
                        <th>País</th>
                        <th>Página web</th>
                    </tr>
                    <xsl:apply-templates select="artista[nacimiento > 1500]">
                        <xsl:sort select="nacimiento" data-type="number" order="ascending"></xsl:sort>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="artista">
        <tr>
            <td>
                <xsl:value-of select="@cod"></xsl:value-of>
            </td>
            <td>
                <xsl:value-of select="nombreCompleto"></xsl:value-of>
            </td>
            <td>
                <xsl:value-of select="nacimiento"></xsl:value-of>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="fallecimiento">
                        <xsl:value-of select="fallecimiento"></xsl:value-of>
                    </xsl:when>
                    <xsl:otherwise>Desconocido</xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:value-of select="pais"></xsl:value-of>
            </td>
            <td>
                <a target="_blank" href="{fichaCompleta}">Saber más</a>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>