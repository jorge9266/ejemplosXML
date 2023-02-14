<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : songlist.xsl
    Created on : 14 de febrero de 2023, 12:45
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
                <title>Lista de Canciones</title>
                <style>
                    body{
                    display:flex;
                    flex-direction:column;
                    justify-content:center;
                    align-items:center;
                    
                    }
                    table{
                    border:solid;
                    border-collapse:collapse;
                    }
                    table td{
                    border:solid;
                    padding:1em;
                    }
                    table th{
                    background-color:black;
                    color:white;
                    padding:1em;
                    }
                    tr.top td{
                    background-color:yellow;
                    }  
                </style>
            </head>
            <body>
                <h1>Lista de Canciones</h1>
                <table>
                    <tr>
                        <th>Titulo</th>
                        <th>Disco</th>
                        <th>Artista</th>
                        <th>Escritor</th>
                        <th>Productor</th>
                        <th>Fecha de salida</th>
                        <th>Racha</th>
                        <th>Posicion</th> 
                    </tr>
                    <xsl:for-each select="songlist/song[artist='David Bowie']">
                    <xsl:sort select="title" order="ascending"/>
                    <tr>
                    <xsl:if test="position='No. 1'" >
                        <xsl:attribute name="class">
                            top
                        </xsl:attribute>
                    </xsl:if>    
                        <td><xsl:value-of select="./title"/></td>
                        <td><xsl:value-of select="./appears"/></td>
                        <td><xsl:value-of select="./artist"/></td>
                        <td><xsl:value-of select="./writers"/></td>
                        <td><xsl:value-of select="./producer"/></td>
                        <td><xsl:value-of select="./released"/></td>
                        <td><xsl:value-of select="./streak"/></td>
                        <td><xsl:value-of select="./position"/></td>   
                    </tr>
                    </xsl:for-each>
                    </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>



       