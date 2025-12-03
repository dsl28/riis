<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:variable name="riis" select="document('../xml/currentriis.xml')"/>
    
    <xsl:template match="riis">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/testreadingview.html">
        <html>
            
            <head><title>How The Other Half Lives</title>
                <link rel="stylesheet" type="text/css" href="../docs/style.css"/></head>
            
            <body>
                <xsl:for-each select=".//div">
                    <xsl:if test="./head">
                        <h2><xsl:apply-templates/></h2>
                    </xsl:if>
                    <xsl:if test="./ab">
                        <p><xsl:apply-templates/></p>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="immigrants">
        <span class="immigrants"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="conditions">
        <span class="conditions"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="death">
        <span class="death"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="vice">
        <span class="vice"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="disease">
        <span class="disease"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="crime">
        <span class="crime"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="work">
        <span class="work"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="policing">
        <span class="policing"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="children">
        <span class="children"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="charity">
        <span class="charity"><xsl:apply-templates/></span>
    </xsl:template>
    
    
    
</xsl:stylesheet>
    





