<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
    <xsl:output method="html" encoding="utf-8" doctype-system="html" media-type="text/html"/>
    <xsl:template match = "/icestats" >
        <html>
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Icecast2 Server | Clients </title>
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

                    <h2 class="admin-page-header">Listener Stats</h2>
                    <xsl:for-each select="source">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Mountpoint <var><xsl:value-of select="@mount" /></var>
                            </div>
                            <div class="panel-body">
                                <xsl:choose>
                                    <xsl:when test="listener">
                                        <table class="table table-stripped">
                                            <thead>
                                                <tr>
                                                    <th>IP</th>
                                                    <th>Sec. connected</th>
                                                    <th>User Agent</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <xsl:variable name = "themount"><xsl:value-of select="@mount" /></xsl:variable>
                                                <xsl:for-each select="listener">
                                                    <tr>
                                                        <td><xsl:value-of select="IP" />
                                                            <xsl:if test="username">
                                                                (<xsl:value-of select="username" />)
                                                            </xsl:if></td>
                                                        <td><xsl:value-of select="Connected" /></td>
                                                        <td><xsl:value-of select="UserAgent" /></td>
                                                        <td><a href="killclient.xsl?mount={$themount}&amp;id={ID}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-ban-circle"></span> Kick</a></td>
                                                    </tr>
                                                </xsl:for-each>
                                            </tbody>
                                        </table>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p class="alert alert-warning"><b>No listeners connected</b></p>
                                    </xsl:otherwise>
                                </xsl:choose>
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