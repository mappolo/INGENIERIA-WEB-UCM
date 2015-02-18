<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_bookuser.jspf"%>
<br>
<div align="center">
<H1>¡ATENCIÓN!</H1>
<p> Eliminación en cascada.</p>
<p> Mirar <a href="admin">aquí</a></p>
</div>
<div id="data" align="center">
<%@ include file="../fragments/busqueda.jspf"%>
<br>
	<p>Libros_Usuarios
	<table >
		<tr>
			<th>id
			<th>comentario
			<th>estado
			<th>books_id
			<th>owners_id
			<th>Eliminar
		</tr>
		<tbody id="datadBookUser">
			<c:forEach items="${busers}" var="bu">
				<tr>
					<td>${bu.id}
					<td>${bu.comentario}
					<td>${bu.estado}<%-- <td><a href="/publisher/${b.publishers.id}">${b.publishers.name}</a> --%>
					<td>(${bu.books.id}) ${bu.books.title}
					<td>(${bu.owners.id}) ${bu.owners.login}
					<td><button class="bu" id="del_${bu.id}">eliminiar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>
	<br>
<%@ include file="../fragments/footer.jspf" %>