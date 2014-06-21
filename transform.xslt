<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
	<xsl:template match="/">
		<xsl:apply-templates select="/html/body/div/div/div/div[@id='bodyContent']" />
	</xsl:template>

	<xsl:template match="/html/body/div/div/div/div[@id='bodyContent']"> <!-- extract div -->
		<xsl:value-of select="/html/body/div/div/div/h1[@class='firstHeading']" /> <!-- insert heading -->
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template select="/html/body/div/div/div/div[@id='bodyContent']"> <!-- delete parent div but preserve content -->
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="h3[@id='siteSub']" /> <!-- delete siteSub heading -->
	
	<xsl:template match="span[@id='editsection']" /> <!-- delete editsection -->
	
	<xsl:template match="span"> <!-- delete span tag but preserve content -->
		<xsl:apply-templates />
	</xsl:template>
	
	<!-- replace tex formular images with their alt attribute -->
	<xsl:template match="img[@class='tex']">
		<code><xsl:value-of select="./@alt" /></code>
	</xsl:template>
	
	<xsl:template match="script" /> <!-- delete script nodes -->
	<xsl:template match="img" /> <!-- delete img nodes -->
	
	<!-- delete thumbnail boxes -->
	<xsl:template match="div[@class='thumb tright']" />
	<xsl:template match="div[@class='thumb tleft']" />
	
	<xsl:template match="div[@class='printfooter']" /> <!-- delete footer note -->
	
	<xsl:template match="@class" /> <!-- delete class attributes -->
	<xsl:template match="@style" /> <!-- delete style attributes -->
	<xsl:template match="@title" /> <!-- delete title attributes -->
	<xsl:template match="@rel" /> <!-- delete rel attributes -->
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
