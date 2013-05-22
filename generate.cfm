<cfdirectory action="list" name="flist" directory="#ExpandPath('www/')#" filter="*.cfm">

<!--- <cfset urlpath = "http://localhost:8080"> --->
<cfset urlpath = "http://wsbeta.osment.com/_projects/CF-Ratchet-Parse-Phonegap-ToDo-Example">

<cfloop query="#flist#">
	<cfhttp url="#urlpath#/www/#name#">
    <cfset newName = ListFirst(name,".") & ".html">
    <cfset newContent = Replace(cfhttp.filecontent,".cfm",".html","ALL")>
    <cffile action="write"
        file='#ExpandPath(".")#\www\#newName#'
        output="#newContent#">
</cfloop>

<cfif isDefined("url.redir")>
	<cflocation addtoken="no" url="www/index.html">
</cfif>

<a href="generate.cfm?redir">Generate new index.html</a>