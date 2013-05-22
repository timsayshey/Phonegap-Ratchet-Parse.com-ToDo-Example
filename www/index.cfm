<cfoutput>

	<!DOCTYPE html>
	<html>
		<head>
			
			<cfdirectory action="list" directory='#ExpandPath(".")#\pages' name="qPages">			
			<cfset pageList = "">
			<cfloop query="qPages">
				<cfset page = ListFirst(name,".")>
				<cfif page neq "_notes">
					<cfset pageList = ListAppend(pageList,page)>
				</cfif>
			</cfloop>
			
			<cfinclude template="includes/header.cfm">			
			<!--- <script src="http://10.1.1.3:8080/target/target-script-min.js##anonymous"></script> --->
		
		</head>
		<body>
		
			<div class="overlay" style="display:none;">
				<div class="overlay-inner">
					<div class="overlay-loader" style="display:none;">
						<div id="toolong" style="display:none;">
							<a href="##" onclick='hideLoader(); return false;' class="button-positive">Taking too long?</a>
						</div>
					</div>
					<div class="overlay-box" style="display:none;"></div>
				</div>
			</div>
		
			<cfloop list="#pageList#" index="pageid">
				<cftry>
					<cfinclude template="pages/#pageid#.cfm">
					<cfcatch>
						<script>
							//alert("#pageid#");
						</script>
					</cfcatch>
				</cftry>
			</cfloop>
		
		</body>
	</html>

</cfoutput>
