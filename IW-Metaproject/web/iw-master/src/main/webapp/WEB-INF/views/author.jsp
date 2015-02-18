<%@ include file="../fragments/headerweb.jspf"%>

<meta http-equiv="content-type" content="text/html; charset=Cp1252">
<!-- base href="http://apexdev.us.oracle.com:7778/pls/apx11w/" -->

 <div>
	<h1>Formulario para ver un autor</h1>
	<table>
		<tr>
			<th>campo</th>
			<th>valor</th>
		</tr>
		<tr>
			<td>id</td>
			<td>${author.id}</td>
		</tr>
		<tr>
			<td>Nombre</td>
			<td>${author.name}</td>
		</tr>
	</table>
</div> 
<br>

<%@ include file="../fragments/footer.jspf"%>