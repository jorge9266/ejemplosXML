<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : ejercicioexamen.xsl
    Created on : 20 de febrero de 2023, 14:13
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
                <title>Ejercicio Examen</title>
                <style>
                   
                div{
                    margin: 30px auto;
                    border:solid;
                    padding: 30px;
                    display:flex;
                    flex-direction:column;
                    align-items:center;
                    }
                    
                table{
                    border-collapse: collapse;
                    border:solid;
                    }
                    
                table td, table th{
                    border:solid;
                    }
                    
                tr.suspenso {
                    background-color:red;
                    } 
 
  
                </style>
            </head>
            <body>
                <div>
                <hi>Listado de notas de Clase</hi> 
                <p>
                    <xsl:value-of select="count(/clase/alumno)"/>
                </p>   
                </div>
                
                <xsl:for-each select="clase/alumno">
                <div>
                  <h1>
                    <xsl:value-of select="nombre" />&#160;
                    <xsl:value-of select="apellido" />
                 </h1>
                    
                 <p>
                    <xsl:value-of select="@dni" />
                 </p>
                 
                 <table>
                     <xsl:for-each select="notas/nota">
                     <tr>
                        <xsl:if test=". &lt; 5">
                            <xsl:attribute name="class">
                                suspenso
                            </xsl:attribute>
                        </xsl:if>
                         <th><xsl:value-of select="@nombre"/></th>
                         <td><xsl:value-of select="."/></td>
                     </tr>
                     </xsl:for-each>
                    <tr>
                         <th>Media</th>
                         <td><xsl:value-of select="round(sum(notas/nota) div count(notas/nota))"/></td>
                    </tr>
                 </table>
                </div>   
                </xsl:for-each>  
                  
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
