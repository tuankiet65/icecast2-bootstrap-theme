<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
    <xsl:output method="html" encoding="utf-8" doctype-system="html" media-type="text/html"/>
    <xsl:template match = "/icestats" >
        <html>
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Icecast2 Server | Version</title>
                <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css" />
                <link rel="stylesheet" type="text/css" href="/assets/css/main.css" />
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <ul class="nav nav-pills pull-right">
                            <li><a href="admin/">Administration</a></li>
                            <li><a href="status.xsl">Server Status</a></li>
                            <li class="active"><a href="server_version.xsl">Version</a></li>
                        </ul>
                        <div id="text-header">
                            <img src="/assets/img/icecast.png" alt="Icecast logo" />
                            <h3>Icecast2 Server Information</h3>
                        </div>
                    </div>
                    
                    <xsl:for-each select="/icestats">
                        <div class="panel panel-info">
                            <div class="panel-heading">Server Information</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-sm-5">
                                        <dl class="dl-horizontal">
                                            <dt>Administrator:</dt>
                                            <dd><xsl:value-of select="admin" /></dd>
                                            <dt>Version:</dt>
                                            <dd><xsl:value-of select="server_id" /></dd>
                                            <dt>Host:</dt>
                                            <dd><xsl:value-of select="host" /></dd>
                                            <dt>Location:</dt>
                                            <dd><xsl:value-of select="location" /></dd>
                                        </dl>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-sm-7">
                                        <dl class="dl-horizontal">
                                            <dt>Homepage:</dt>
                                            <dd><a href="http://icecast.org" target="_blank">icecast.org</a></dd>
                                            <dt>Git repository:</dt>
                                            <dd><a href="https://git.xiph.org/?p=icecast-server.git;a=summary" target="_blank">git.xiph.org/?p=icecast-server</a></dd>
                                            <dt>Documentation:</dt>
                                            <dd><a href="http://icecast.org/docs.php" target="_blank">icecast.org/docs.php</a></dd>
                                            <dt>Stream Directory:</dt>
                                            <dd><a href="http://dir.xiph.org/index.php" target="_blank">dir.xiph.org</a></dd>
                                            <dt>Community:</dt>
                                            <dd><a href="http://forum.icecast.org/" target="_blank">forum.icecast.org</a></dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                    <div class="footer">
                        Support Icecast development at <a href="http://www.icecast.org" target="_blank">www.icecast.org</a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
