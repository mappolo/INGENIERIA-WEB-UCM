<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_request.jspf"%>

<br>
<div id="data" align="center">
	<%@ include file="../fragments/busqueda.jspf"%>
	<br>
	<p>Peticiones
	<table>
		<tr>
			<th>id
			<th>estado
			<th>book_user_id
			<th>userIn_id
			<th>userOut_id
			<th>Eliminar
		</tr>
		<tbody id="dataRequest">
			<c:forEach items="${requests}" var="r">
				<tr>
					<td>${r.id}
					<td>${r.estado}
					<td>(${r.book_user.id}) ${r.book_user.books.title}
					<td>(${r.userIn.id}) ${r.userIn.login}
					<td>(${r.userOut.id}) ${r.userOut.login}
					<td><button class="re" id="del_${r.id}">eliminar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>
<br>
<%@ include file="../fragments/footer.jspf"%>