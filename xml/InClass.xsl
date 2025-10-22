<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Places Mentioned in Georg Forster Account</title>
            </head>
            <body>
                <h1>Places Listed in Each Chapter of Georg Forster’s Voyage Record</h1>
                <ul>
                    <xsl:apply-templates select="//text/body//div[@type='book']"/>
                </ul>
            </body>
        </html>
        
    </xsl:template>
    <xsl:template match="div[@type='book']">
        <li>
            <xsl:apply-templates select="head"/>
            <ul>
                <xsl:apply-templates select="./div[@type='chapter']"/>
                
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="div[@type='chapter']">
        <li>
            <xsl:apply-templates select="head/l"/>
            <ul>
                <xsl:apply-templates select="descendant::p/placeName"/>
                
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="p/placeName">
        
        <li><xsl:apply-templates/>
            
        </li>
    </xsl:template>
    
</xsl:stylesheet>