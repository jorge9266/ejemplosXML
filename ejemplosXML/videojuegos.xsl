<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : videojuegos.xsl
    Created on : 23 de febrero de 2023, 12:22
    Author     : JorgeMorenoCrespo
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
                <title>Listado de videojuegos</title>
                
            </head>
            <body>
                
                <table class="table">
                    <h1 class="text-center"> Lista de Videojuegos</h1>
                  <thead>
                    <tr>
                      <th class="align-middle" scope="col">Nombre</th>
                      <th class="align-middle" scope="col">Descripcion</th>
                      <th class="align-middle" scope="col">Año</th>
                      <th class="align-middle" scope="col">Desarrollador</th>
                      <th class="align-middle" scope="col">Estado del Driver</th>
                      <th class="align-middle" scope="col">Tipo de display</th>
                      <th class="align-middle" scope="col">Orientacion</th>
                      <th class="align-middle" scope="col">SourceFile</th>
                    </tr>
                  </thead>
                  <tbody>
                      <xsl:for-each select="mame/arcade">
                          <xsl:if test="is_runnable='YES'">
                            <tr>
                              <xsl:attribute name="class">
                                  <xsl:choose>
                                      <xsl:when test="driver_status = 'INCOMPLETO'">bg-danger</xsl:when>
                                      <xsl:when test="driver_status = 'PRELIMINARE'">bg-warning</xsl:when>
                                      <xsl:when test="driver_status = 'BUONO'">bg-success</xsl:when>
                                  </xsl:choose>
                              </xsl:attribute>
                      <td scope="row"><xsl:value-of select="./name"/></td>
                      <td><xsl:value-of select="./description"/></td>
                      <td><xsl:value-of select="./year"/></td>
                      <td><xsl:value-of select="./manufacturer"/></td>
                      <td><xsl:value-of select="./driver_status"/></td>
                      <td><xsl:value-of select="./display_type"/></td>
                      <td><xsl:value-of select="./display_orientation"/></td>
                      <td><xsl:value-of select="./sourcefile"/></td>
                    </tr>
                      </xsl:if>     
                     </xsl:for-each>
                  </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
