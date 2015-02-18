<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_person.jspf"%>
<br>
<div id="data" align="center">
	<%@ include file="../fragments/busqueda.jspf"%>
	<br>
	<p>Personas
	<table>
		<tr>
			<th>id
			<th>email
			<th>name
			<th>surname1
			<th>surname2
			<th>user_id
			<th>Eliminar
		</tr>
		<tbody id="dataPerson">
			<c:forEach items="${persons}" var="pe">
				<tr>
					<td>${pe.id}
					<td>${pe.mail}
					<td>${pe.name}
					<td>${pe.surname1}
					<td>${pe.surname2}
					<td>(${pe.user.id}) ${pe.user.login}
					<td><button class="pe" id="del_${pe.id}">eliminar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>
<br>
<%@ include file="../fragments/footer.jspf"%>