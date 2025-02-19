<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:sm="http://www.sitemaps.org/schemas/sitemap/0.9"
 xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
 xmlns:mobile="http://www.google.com/schemas/sitemap-mobile/1.0"
 xmlns:video="http://www.google.com/schemas/sitemap-video/1.1"
>

  <!--matching a siteindex file-->

  <xsl:template match="sm:sitemapindex">
    <html>
      <head>
        <title>Sitemap Index</title>
        <xsl:call-template name="style"/>
      </head>
      <body>
        <h1>Sitemap Index</h1>

        <table border="1">
          <thead>
            <tr>
              <th>Sitemap</th>
              <th>Last modified</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates/>
          </tbody>
        </table>
        <a href="http://www.inspyder.com/products/SitemapCreator/">Sitemap Generated by Inspyder Sitemap Creator</a>

      </body>

    </html>
  </xsl:template>

  <xsl:template match="sm:sitemap">
    <tr>
      <td>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="sm:loc"/>
          </xsl:attribute>
          <xsl:value-of select="sm:loc"/>
        </a>
      </td>
      <td>
        <xsl:value-of select="sm:lastmod"/>
      </td>
    </tr>
  </xsl:template>


  <xsl:template match="sm:urlset">

    <html>
      <head>
        <title>Sitemap</title>
        <xsl:call-template name="style"/>
      </head>
      <body>
        <h1>XML Sitemap</h1>
        <table>
          <thead>
            <tr>
              <th>URL</th>
              <th align="center">Last Modified</th>
              <th align="center">Change Frequency</th>
              <th align="right">Priority</th>
              <th align="right">Images</th>
              <th align="right">Videos</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates/>
          </tbody>
        </table>

        <a href="http://www.inspyder.com/products/SitemapCreator/">Sitemap Generated by Inspyder Sitemap Creator</a>
      </body>
    </html>

  </xsl:template>


  <xsl:template match="sm:url">
    <tr>
      <td>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="sm:loc"/>
          </xsl:attribute>
          <xsl:value-of select="sm:loc"/>
        </a>
      </td>
      <td align="center">
        <xsl:value-of select="sm:lastmod"/>
      </td>
      <td style="text-transform:uppercase;"  align="center">
        <xsl:value-of select="sm:changefreq"/>
      </td>
      <td align="right">
        <xsl:value-of select="sm:priority"/>
      </td>
      <td align="right">
        <xsl:value-of select="count(image:image)"/>
      </td>
      <td align="right">
        <xsl:value-of select="count(video:video)"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="style">
    <style>
      body{

      font-size:12px;
      font-family:Tahoma,Geneva,Arial,sans-serif;
      padding-left: 25px;
      padding-right: 25px;
      background-color: #d5d5e5;
      }
      h1,th {letter-spacing:1px;}
      a:link,a:visited,a:hover,a:active,a:focus{text-decoration:none;outline:none;-moz-outline-style:none;}
      a{color:#084c8d;}
      a:hover{color:#aaa;}

      table {border-collapse:collapse;border-spacing:0;width:100%;margin-bottom:18px;}
      table,td,th {vertical-align:middle;}
      th{padding:10px;color:#084c8d;text-transform:uppercase;}
      td{padding:10px;color:#084c8d;}
      th,tr:hover{background-color:#6682b5;}

      h1{font-weight:normal;line-height:100%;}
      h1{font-size:36px;}
    </style>
  </xsl:template>

</xsl:stylesheet>
