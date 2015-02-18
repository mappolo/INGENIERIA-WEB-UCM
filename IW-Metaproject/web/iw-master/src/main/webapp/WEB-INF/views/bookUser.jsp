<%@ include file="../fragments/headerweb.jspf" %>
<meta http-equiv="content-type" content="text/html; charset=Cp1252">
<!-- base href="http://apexdev.us.oracle.com:7778/pls/apx11w/" -->

<br>
<div id="principal" align="center">
	<form action="${prefix}newRequest" id="formularioLogin" method="POST">
		
	<h1>${bu.books.title} de ${bu.owners.login}</h1>
		<table border="1px">
		<tr>
			<th>id
			<th>comentario
			<th>estado
			<th>título
			<th>owners_id
			<th>Acción
			
		</tr>
		<tbody id="data">
				<tr>
					<td>${bu.id}
					<td>${bu.comentario}
					<td>${bu.estado}
					<td>${bu.books.title}
					<td>(${bu.owners.id}) ${bu.owners.login}
					<input type="hidden" id="source" name="source"value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
					<input type="hidden" id="userI" name="userI" value="${bu.owners.login}" />
					<input type="hidden" id="userO" name="userO" value="${e:forHtmlContent(user.login)}" />
					<input type="hidden" id="title" name="title" value="${bu.books.title}" />
					<td><button name="submit" value="login" type="submit">Pedir</button>

				</tr>
		</tbody>
	</table>	
		
	</form>
</div>

	<br>
<%@ include file="../fragments/footer.jspf" %>
