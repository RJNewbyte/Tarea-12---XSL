<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <fo:root>

            <fo:layout-master-set>
                <fo:simple-page-master master-name="Plantilla-A4" page-height="29.7cm"
                    page-width="21.0cm" margin-top="2cm" margin-bottom="1cm" margin-left="2cm"
                    margin-right="2cm">
                    <fo:region-body margin-bottom="1cm" />
                    <fo:region-after extent="-1cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <!-- METADATOS XMP (eXtensible Metadata Platform), https://xmlgraphics.apache.org/fop/1.1/metadata.html-->
            <fo:declarations> <!--Esta es una etiqueta de Apache FOP que se utiliza para contener declaraciones que se aplican a todo el documento.-->
                <x:xmpmeta xmlns:x="adobe:ns:meta/"> <!--Esta es la etiqueta raíz para los metadatos XMP, define el espacio de nombres para los elementos XMP.-->
                  <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><!-- Esta es la etiqueta raíz para los metadatos RDF (Resource Description Framework), 
                    que es el formato que utiliza XMP para almacenar metadatos, define el espacio de nombres para los elementos RDF. -->
                    <rdf:Description rdf:about=""
                        xmlns:dc="http://purl.org/dc/elements/1.1/"> <!-- Define el espacio de nombres para los elementos del Dublin Core, que es un conjunto de elementos de metadatos que se utilizan comúnmente.-->
                      <dc:title>Tarea 12 XSLT</dc:title>
                      <dc:creator>Rodrigo Mulero García</dc:creator>
                    </rdf:Description>
                  </rdf:RDF>
                </x:xmpmeta>
              </fo:declarations>

            <!-- Árbol de marcadores -->
            <fo:bookmark-tree>
                <xsl:for-each select="//h1">
                    <fo:bookmark internal-destination="{generate-id(.)}">
                        <fo:bookmark-title>
                            <xsl:value-of select="." />
                        </fo:bookmark-title>
                        <xsl:for-each select="following-sibling::h2[preceding-sibling::h1[1] = current()]">
                            <fo:bookmark internal-destination="{generate-id(.)}">
                                <fo:bookmark-title>
                                    <xsl:value-of select="." />
                                </fo:bookmark-title>
                                <xsl:for-each select="following-sibling::details[preceding-sibling::h2[1] = current()]/h3">
                                    <fo:bookmark internal-destination="{generate-id(.)}">
                                        <fo:bookmark-title>
                                            <xsl:value-of select="." />
                                        </fo:bookmark-title>
                                    </fo:bookmark>
                                </xsl:for-each>
                            </fo:bookmark>
                        </xsl:for-each>
                    </fo:bookmark>
                </xsl:for-each>
            </fo:bookmark-tree>


            <!-- Plantilla A4 con pie de página numerado-->
            <fo:page-sequence master-reference="Plantilla-A4">
                <fo:static-content flow-name="xsl-region-after" display-align="after">
                    <fo:table width="100%" font-size="10pt" background-color="#D3D3D3">
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell text-align="left">
                                    <fo:block>Tarea 12. - XSLT</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="center">
                                    <fo:block>
                                        <xsl:text>&lt; Página </xsl:text>
                                        <fo:page-number />
                                        <xsl:text> de </xsl:text>
                                        <fo:page-number-citation ref-id="last-page" />
                                        <xsl:text> &gt;</xsl:text>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right">
                                    <fo:block>Curso 2023-2024</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="//body" />
                    <fo:block id="last-page" />
                </fo:flow>
            </fo:page-sequence>

        </fo:root>
    </xsl:template>

    <!-- ELEMENTOS -->
    <xsl:template match="title">
        <fo:block font-size="18pt" font-weight="bold">
            <xsl:value-of select="." />
        </fo:block>
    </xsl:template>

    <xsl:template match="body">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="summary">
        <fo:block font-size="10pt" font-style="italic" space-after="6pt">
            <xsl:value-of select="." />
        </fo:block>
    </xsl:template>

    <xsl:template match="details">
        <fo:block font-family="Open Sans" font-size="12pt" space-after="12pt">
            <xsl:apply-templates />
        </fo:block>
    </xsl:template>

    <xsl:template match="h1">
        <fo:block font-size="24pt" space-after="12pt" id="{generate-id()}">
            <xsl:value-of select="." />
        </fo:block>
    </xsl:template>

    <xsl:template match="h2">
        <fo:block font-size="14pt" font-weight="bold" space-after="6pt" id="{generate-id()}">
            <xsl:value-of select="." />
        </fo:block>
    </xsl:template>

    <xsl:template match="h3">
        <fo:block font-size="12pt" font-weight="bold" space-after="6pt" id="{generate-id()}">
            <xsl:value-of select="." />
        </fo:block>
    </xsl:template>

    <xsl:template match="p">
        <fo:block font-family="Open Sans" font-size="12pt" space-after="6pt">
            <xsl:apply-templates />
        </fo:block>
    </xsl:template>

    <xsl:template match="a">
        <fo:basic-link external-destination="{@href}" color="blue" text-decoration="underline">
            <xsl:value-of select="." />
        </fo:basic-link>
    </xsl:template>

    <xsl:template match="ul">
        <fo:block space-after="12pt">
            <xsl:apply-templates />
        </fo:block>
    </xsl:template>

    <xsl:template match="li">
        <fo:block font-size="12pt">
            <!-- Almacenar el texto completo del elemento li en una variable -->
            <xsl:variable name="text" select="normalize-space(.)" />
            <!-- Verificar si el texto contiene ':' -->
            <xsl:choose>
                <xsl:when test="contains($text, ':')">
                    <!-- Aplicar negrita hasta el ':' incluido -->
                    <fo:inline font-weight="bold">
                        <xsl:value-of select="substring-before($text, ':')" />
                        <xsl:text>:</xsl:text>
                    </fo:inline>
                    <!-- Texto después del ':' -->
                    <xsl:value-of
                        select="substring-after($text, ':')" />
                </xsl:when>
                <xsl:otherwise>
                    <!-- Si no hay ':', mostrar el texto tal cual -->
                    <xsl:value-of select="$text" />
                </xsl:otherwise>
            </xsl:choose>
        </fo:block>
    </xsl:template>


    <xsl:template match="pre/code">
        <fo:block font-family="Monaco" font-size="10pt" background-color="#f0f0f0"
            space-before="5pt" space-after="15pt"
            white-space-collapse="false" linefeed-treatment="preserve"
            white-space-treatment="preserve">
            <xsl:apply-templates />
        </fo:block>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="." />
    </xsl:template>


</xsl:stylesheet>