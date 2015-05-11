<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
    <xsl:output method="html" encoding="utf-8" doctype-system="html" media-type="text/html"/>
    <xsl:template match = "/icestats" >
        <html>
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Icecast2 Server | Mountpoints</title>
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

                    <h2 class="admin-page-header">Active Mountpoints</h2>
                    <xsl:for-each select="source">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Mountpoint <var><xsl:value-of select="@mount" /></var>
                                <div class="pull-right">
                                    <xsl:choose>
                                        <xsl:when test="authenticator">
                                            <a href="/auth.xsl" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-lock"></span> Login</a>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <a href="{@mount}.m3u" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> M3U</a>
                                            <a href="{@mount}.xspf" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> XSPF</a>
                                            <a href="{@mount}.vclt" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> VLCT</a>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </div>
                            </div>
                            <div class="panel-body">
                                <xsl:choose>
                                    <xsl:when test="authenticator">
                                        <div class="center-block source-actions btn-toolbar" style="max-width: 807px">
                                            <a href="listclients.xsl?mount={@mount}" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span> List Clients</a>
                                            <a href="moveclients.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-transfer"></span> Move Listeners</a>
                                            <a href="updatemetadata.xsl?mount={@mount}" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span> Update Metadata</a>
                                            <a href="manageauth.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-cog"></span> Manage Authentication</a>
                                            <a href="killsource.xsl?mount={@mount}" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Kill Source</a>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="center-block source-actions btn-toolbar" style="max-width: 594px">
                                            <a href="listclients.xsl?mount={@mount}" class="btn btn-primary"><span class="glyphicon glyphicon-list"></span> List Clients</a>
                                            <a href="moveclients.xsl?mount={@mount}" class="btn btn-warning"><span class="glyphicon glyphicon-transfer"></span> Move Listeners</a>
                                            <a href="updatemetadata.xsl?mount={@mount}" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span> Update Metadata</a>
                                            <a href="killsource.xsl?mount={@mount}" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Kill Source</a>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <p>
                                    <xsl:value-of select="listeners" />
                                    <xsl:choose>
                                        <xsl:when test="listeners > 1">
                                            Listeners
                                        </xsl:when>
                                        <xsl:otherwise>
                                            Listener
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </p>
                            </div>
                        </div>
                    </xsl:for-each>
                    <div class="footer">
                        Support Icecast development at <a href="http://www.icecast.org">www.icecast.org</a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>