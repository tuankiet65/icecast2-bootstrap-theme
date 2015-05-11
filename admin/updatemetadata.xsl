<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
    <xsl:output method="html" encoding="utf-8" doctype-system="html" media-type="text/html"/>
    <xsl:template match = "/icestats" >
        <html>
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Icecast2 Server | Update Metadata</title>
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

                    <h2 class="admin-page-header">Update Metadata</h2>
                    <xsl:for-each select="source">
                        <div class="panel panel-info">
                            <div class="panel-heading">Mountpoint <i><xsl:value-of select="@mount" /></i>
                            </div>
                            <div class="panel-body">
                                <form action="/admin/metadata.xsl"  method="get" role="form">
                                    <input type="hidden" name="mount" value="{@mount}" />
                                    <input type="hidden" name="mode" value="updinfo" />
                                    <input type="hidden" name="charset" value="UTF-8" />
                                    <div class="input-group">
                                        <label for="song" class="input-group-addon">Metadata:</label>
                                        <input type="text" id="song" name="song" class="form-control" />
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Update</button>
                                        </div>
                                    </div>
                                </form>
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