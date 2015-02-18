<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_author.jspf"%>

<br>
<div id="data" align="center">
	<%@ include file="../fragments/busqueda.jspf"%>
	<br>
	<p>Autores
		<table>
		<tr>
			<th>id
			<th>name
			<th>Eliminar
		</tr>
		<tbody id="dataAuthor">
			<c:forEach items="${authors}" var="a">
				<tr>
					<td>${a.id}
					<td>${a.name}
					<td><button class="au" id="del_${a.id}">eliminar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>
<br>
<%@ include file="../fragments/footer.jspf"%>