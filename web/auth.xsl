<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" >
	<xsl:output method="html" encoding="utf-8" doctype-system="html" media-type="text/html"/>
	<xsl:template match = "/icestats">
		<html>
			<head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Icecast2 Server | Mountpoints Login</title>
                <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css" />
                <link rel="stylesheet" type="text/css" href="/assets/css/main.css" />
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <ul class="nav nav-pills pull-right">
                            <li><a href="/admin/">Administration</a></li>
                            <li class="active"><a href="status.xsl">Server Status</a></li>
                            <li><a href="server_version.xsl">Version</a></li>
                        </ul>
                        <div id="text-header">
                            <img src="/assets/img/icecast.png" alt="Icecast logo" />
                            <h3>Icecast2 Login Interface</h3>
                        </div>
                    </div>

					<xsl:for-each select="source">
						<xsl:if test="authenticator">
							<div class="panel panel-default">
								<div class="panel-heading">
									<xsl:if test="server_name">
										<xsl:value-of select="server_name" />
									</xsl:if>
									(<i><xsl:value-of select="@mount" /></i>)
								</div>
								<div class="panel-body">
									<form method="GET" action="/admin/buildm3u" class="form-inline" role="form">
										<input type="hidden" name="mount" value="{@mount}" />
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
						</xsl:if>
					</xsl:for-each>
					<div class="footer">
						Support Icecast development at <a target="_blank" href="http://www.icecast.org">www.icecast.org</a>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
