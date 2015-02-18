<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_genre.jspf"%>
<br>
<div id="data" align="center">
<%@ include file="../fragments/busqueda.jspf"%>
<br>
	<p>Género
	<table >
		<tr>
			<th>id
			<th>genre
			<th>Eliminar
		</tr>
		<tbody id="dataGenre">
			<c:forEach items="${genres}" var="g">
				<tr>
					<td>${g.id}
					<td>${g.genre}
					<td><button class="ge" id="del_${g.id}">eliminar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>
	<br>
<%@ include file="../fragments/footer.jspf" %>