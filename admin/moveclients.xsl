<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
    <xsl:output method="html" encoding="utf-8" doctype-system="html" media-type="text/html"/>
    <xsl:template match = "/icestats" >
        <html>
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Icecast2 Server | Move Listeners</title>
                <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css" />
                <link rel="stylesheet" type="text/css" href="/assets/css/main.css" />
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <ul class="nav nav-pills pull-right">
                            <li><a href="/admin/">Admin Home</a></li>
                            <li class="active"><a href="listmounts.xsl">Mountpoints</a></li>
                            <li><a href="/">Public Home</a></li>
                        </ul>
                        <div id="text-header">
                            <img src="/assets/img/icecast.png" alt="Icecast logo" />
                            <h3>Icecast2 Admin Interface</h3>
                        </div>
                    </div>

                    <xsl:variable name = "currentmount">
                        <xsl:value-of select="current_source" />
                    </xsl:variable>
                    <h2 class="admin-page-header">Moving listeners from <code><xsl:value-of select="current_source" /></code></h2>
                    <div class="panel panel-info">
                        <div class="panel-heading">Move to which mountpoint?</div>
                        <div class="panel-body">
                            <div class="move-source center-block">
                                <xsl:for-each select="source">
                                        <a class="btn btn-lg btn-block btn-primary" href="/admin/moveclients?mount={$currentmount}&amp;destination={@mount}">
                                            Move to <code><xsl:value-of select="@mount"></xsl:value-of></code>
                                            (currently serving <xsl:value-of select="listeners" /><xsl:choose><xsl:when test="listeners > 1"> listeners</xsl:when><xsl:otherwise> listener</xsl:otherwise></xsl:choose>)
                                        </a>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        Support Icecast development at <a href="http://www.icecast.org">www.icecast.org</a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>