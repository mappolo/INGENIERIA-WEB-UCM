<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_user.jspf"%>

<br>
<div align="center">
<H1>¡ATENCIÓN!</H1>
<p> Eliminación en cascada.</p>
<p> Mirar <a href="admin">aquí</a></p>
</div>
<div id="data" align="center">
<%@ include file="../fragments/busqueda.jspf"%>
<br>
	<p>Usuarios</p>
	<table >
		<tr>
			<th>id
			<th>login
			<th>rol
			<th>hash
			<th>salt
			<th>Foto
			<th>Eliminar
		</tr>
		<tbody id="dataUser">
			<c:forEach items="${users}" var="u" begin="1">
				<tr>
					<td>${u.id}
					<td>${e:forHtmlContent(u.login)}
					<td>${u.role}
					<td>${u.hashedAndSalted}
					<td>${u.salt}
					<td><img src="user/photo?id=${u.id}" height="90px"
						width="90px" />
					<td><button class="us" id="del_${u.id}">eliminar</button>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	<br>
<%@ include file="../fragments/footer.jspf" %>