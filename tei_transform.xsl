<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/tei:TEI">
        <html>
            <head>
                <title><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
            </head>
            <body>
                <h1><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                <h2>Autori</h2>
                <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/>
                <h2>Publicazione</h2>
                <p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/></p>
                <p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/></p>
                <h2>Manoscritto</h2>
                <xsl:apply-templates select="tei:facsimile/tei:surface/tei:graphic"/>
                <h2>Testo</h2>
                <xsl:apply-templates select="tei:text/tei:body/tei:div"/>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="tei:author">
        <p><xsl:value-of select="."/></p>
    </xsl:template>


    <xsl:template match="tei:div">
        <div>
            <xsl:apply-templates select="tei:p"/>
        </div>
    </xsl:template>


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates select="node()"/>
        </p>
    </xsl:template>

    <xsl:template match="tei:graphic">
        <img style="width: 200px; height: auto; display: inline-block; margin-right: 10px;">
        <xsl:attribute name="src"><xsl:value-of select="@url"/></xsl:attribute>
    </img>
    </xsl:template>


    <xsl:template match="tei:del | tei:add | tei:persName | tei:placeName | tei:date">
        <span>
            <xsl:if test="local-name() = 'del'">
                <del><xsl:apply-templates select="node()"/></del>
            </xsl:if>
            <xsl:if test="local-name() = 'add'">
                <ins><xsl:apply-templates select="node()"/></ins>
            </xsl:if>
            <xsl:if test="local-name() = 'persName' or local-name() = 'placeName' or local-name() = 'date'">
                <xsl:apply-templates select="node()"/>
            </xsl:if>
        </span>
    </xsl:template>


    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
</xsl:stylesheet>
