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
                                                    <button class="btn btn-danger btn-xs" data-mountpoint="{@mount}" data-toggle="modal" data-target="#authModal"><span class="glyphicon glyphicon-lock"></span> Login</button>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <a href="{@mount}.m3u" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> M3U</a>
                                                    <a href="{@mount}.xspf" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> <abbr title="XML Shareable Playlist Format">XSPF</abbr></a>
                                                    <a href="{@mount}.vclt" class="btn btn-default btn-xs" role="button"><span class="glyphicon glyphicon-file"></span> <abbr title="Vorbis Comment Like Text">VCLT</abbr></a>
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
                    <div class="modal fade" id="authModal" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><xsl:text disable-output-escaping="yes">&amp;times;</xsl:text></span></button>
                                    <h4 class="modal-title" id="myModalLabel">Login for mountpoint <code class="auth-mountpoint-name"></code></h4>
                                </div>
                                <div class="modal-body">
                                    <form method="GET" action="/admin/buildm3u" class="form-inline" role="form">
                                            <input type="hidden" name="mount" class="auth-mountpoint-name" value="" />
                                            <div class="form-group">
                                                <label class="sr-only" for="username">Username</label>
                                                <input type="text" name="username" id="username" placeholder="Username" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="password">Password</label>
                                                <input type="password" name="password" placeholder="Password" class="form-control" />
                                            </div>
                                            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-lock"></span> Login</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        Support Icecast development at <a href="http://www.icecast.org" target="_blank">www.icecast.org</a>
                    </div>
                </div>
                <script src="/assets/js/jquery.min.js" />
                <script src="/assets/js/bootstrap.min.js" />
                <script src="/assets/js/common.js" />
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>