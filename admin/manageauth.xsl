<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
    <xsl:output method="html" encoding="utf-8" doctype-system="html" media-type="text/html"/>
    <xsl:template match = "/icestats" >
        <html>
            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Icecast2 Server | Manage Authentication</title>
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

                <h2 class="admin-page-header">Manage Authentication</h2>
                <xsl:if test="iceresponse">
                    <div class="panel panel-info">
                        <div class="panel-heading">Message</div>
                        <div class="panel-body">
                            <xsl:for-each select="iceresponse">
                                <xsl:value-of select="message" /><br />
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:if>
                <xsl:for-each select="source">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Mountpoint <i><xsl:value-of select="@mount" /></i>
                        </div>
                        <div class="panel-body">
                            <xsl:if test="User">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:variable name="themount"><xsl:value-of select="@mount" /></xsl:variable>
                                        <xsl:for-each select="User">
                                            <tr>
                                                <td><xsl:value-of select="username" /></td>
                                                <td><a href="manageauth.xsl?mount={$themount}&amp;username={username}&amp;action=delete" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> Delete</a></td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </xsl:if>
                            <fieldset>
                                <legend>Add new user</legend>
                                <form action="/admin/manageauth.xsl" method="get" class="form-inline" role="form">
                                    <input type="hidden" name="mount" value="{@mount}" />
                                    <input type="hidden" name="action" value="add" />
                                    <div class="form-group">
                                        <label class="sr-only" for="username">Username</label>
                                        <input type="text" name="username" id="username" placeholder="Username" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="password">Password</label>
                                        <input type="password" name="password" placeholder="Password" class="form-control" />
                                    </div>
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add</button>
                                </form>
                            </fieldset>
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