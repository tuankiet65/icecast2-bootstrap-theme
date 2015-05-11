<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
    <xsl:output method="html" encoding="utf-8" doctype-system="html" media-type="text/html"/>
    <xsl:template match = "/icestats" >
        <html>
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Icecast2 Server | Status</title>
                <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css" />
                <link rel="stylesheet" type="text/css" href="/assets/css/main.css" />
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <ul class="nav nav-pills pull-right">
                            <li><a href="admin/">Administration</a></li>
                            <li class="active"><a href="status.xsl">Server Status</a></li>
                            <li><a href="server_version.xsl">Version</a></li>
                        </ul>
                        <div id="text-header">
                            <img src="/assets/img/icecast.png" alt="Icecast logo" />
                            <h3>Icecast2 Server Status</h3>
                        </div>
                    </div>

                    <xsl:for-each select="source">
                        <xsl:choose>
                            <xsl:when test="listeners">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        Mountpoint <b><i><xsl:value-of select="@mount" /></i></b>
                                        <div class="pull-right btn-toolbar">
                                            <xsl:choose>
                                                <xsl:when test="authenticator">
                                                    <a href="/auth.xsl" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-lock"></span> Login</a>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <a href="{@mount}.m3u" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> M3U</a>
                                                    <a href="{@mount}.xspf" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> XSPF</a>
                                                    <a href="{@mount}.vclt" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> VCLT</a>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <xsl:if test="server_type and @mount and not(authenticator)">
                                            <div class="audioplayer">
                                                <audio controls="controls" preload="none">
                                                    <source src="{@mount}" type="{server_type}" />
                                                </audio>
                                            </div>
                                        </xsl:if>
                                        <dl class="dl-horizontal">
                                            <xsl:if test="server_name">
                                                <dt>Name:</dt>
                                                <dd><xsl:value-of select="server_name" /></dd>
                                            </xsl:if>
                                            <xsl:if test="server_description">
                                                <dt>Description:</dt>
                                                <dd><xsl:value-of select="server_description" /></dd>
                                            </xsl:if>
                                            <xsl:if test="genre">
                                                <dt>Genre:</dt>
                                                <dd><xsl:value-of select="genre" /></dd>
                                            </xsl:if>
                                            <xsl:if test="stream_start">
                                                <dt>Started:</dt>
                                                <dd><xsl:value-of select="stream_start" /></dd>
                                            </xsl:if>
                                            <xsl:if test="server_type">
                                                <dt>Content Type:</dt>
                                                <dd><xsl:value-of select="server_type" /></dd>
                                            </xsl:if>
                                            <xsl:if test="bitrate">
                                                <dt>Bitrate:</dt>
                                                <dd><xsl:value-of select="bitrate" /> kbps</dd>
                                            </xsl:if>
                                            <xsl:if test="quality">
                                                <dt>Quality:</dt>
                                                <dd><xsl:value-of select="quality" /></dd>
                                            </xsl:if>
                                            <xsl:if test="video_quality">
                                                <dt>Video Quality:</dt>
                                                <dd><xsl:value-of select="video_quality" /></dd>
                                            </xsl:if>
                                            <xsl:if test="frame_size">
                                                <dt>Framesize:</dt>
                                                <dd><xsl:value-of select="frame_size" /></dd>
                                            </xsl:if>
                                            <xsl:if test="frame_rate">
                                                <dt>Framerate:</dt>
                                                <dd><xsl:value-of select="frame_rate" /></dd>
                                            </xsl:if>
                                            <xsl:if test="listeners">
                                                <dt>Listeners:</dt>
                                                <dd><xsl:value-of select="listeners" /></dd>
                                            </xsl:if>
                                            <xsl:if test="listener_peak">
                                                <dt>Peak Listeners:</dt>
                                                <dd><xsl:value-of select="listener_peak" /></dd>
                                            </xsl:if>
                                            <dt>Currently playing:</dt>
                                            <dd>
                                                    <xsl:if test="artist">
                                                        <xsl:value-of select="artist"/> -
                                                    </xsl:if>
                                                    <xsl:value-of select="title" />
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <p><xsl:value-of select="@mount" /> - Not Connected</p>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    <div class="footer">
                        Support Icecast development at <a href="http://www.icecast.org" target="_blank">www.icecast.org</a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>