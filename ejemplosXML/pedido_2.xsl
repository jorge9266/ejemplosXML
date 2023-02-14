<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : pedido.xsl
    Created on : 13 de febrero de 2023, 13:51
    Author     : JorgeMorenoCrespo
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Pedido</title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="/pedido/cliente" />
                </h1>
                <strong>
                    <xsl:value-of select="/pedido/@id"/>
                </strong>
                <xsl:for-each select="/pedido/contenido/articulo">
                    <xsl:sort select="@id" order="descending" /> 
                    <xsl:if test="@id&lt;50 or @id&gt;70">
                    <p>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id" />
                        </xsl:attribute>    
                        <xsl:value-of select="." />
                    </p>
                    </xsl:if>  
                </xsl:for-each>    
                <dl>
                    <dt>Tipo de via</dt>
                    <dd><xsl:value-of select="/pedido/entrega/tipovia" /></dd>
                    <dt>Nombre</dt>
                    <dd><xsl:value-of select="/pedido/entrega/lugar" /></dd>
                    <dt>Numero</dt>
                    <dd><xsl:value-of select="/pedido/entrega/numero" /></dd>
                </dl>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
