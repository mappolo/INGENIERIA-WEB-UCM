<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/peticiones.jspf"%>
<%@ include file="../fragments/deletes/del_request.jspf"%>

<div align="center">
	<%@ include file="../fragments/busqueda.jspf"%>
	<br>
	<p>Mis_Peticiones_enviadas
	<table>
		<tr>
			<th>id
			<th>estado
			<th>book_user_id
			<th>userIn_id
			<th>userOut_id
			<th>email
			<th>Eliminar
		</tr>
		<tbody id="dataRequest">
			<c:forEach items="${requests}" var="r">
				<tr>
					<c:if test="${r.userOut.login == e:forHtmlContent(user.login)}">
						<td>${r.id}
						<td>${r.estado}
						<td>(${r.book_user.id}) ${r.book_user.books.title}
						<td>(${r.userIn.id}) ${r.userIn.login}
						<td>(${r.userOut.id}) ${r.userOut.login}
						<td><c:if test="${r.estado == 'aceptado'}">
						 <a href="mailto:${r.userIn.persona.mail}">${r.userIn.persona.name}</a>
					</c:if>
						<td><button class="re" id="del_${r.id}">eliminar</button>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<p>Mis_Peticiones_recibidas
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
					<c:if test="${r.userIn.login == e:forHtmlContent(user.login)}">
						<td>${r.id}
						<td>${r.estado}
						<td>(${r.book_user.id}) ${r.book_user.books.title}
						<td>(${r.userIn.id}) ${r.userIn.login}
						<td>(${r.userOut.id}) ${r.userOut.login}
						<td><button class="re" id="del_${r.id}">eliminar</button>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<p>Mis_Peticiones_recibidas_pendientes
	<table>
		<tr>
			<th>id
			<th>estado
			<th>book_user_id
			<th>userIn_id
			<th>userOut_id
		</tr>
		<tbody id="req">
			<c:forEach items="${requests}" var="r">
				<tr>
					<c:if test="${r.userIn.login == e:forHtmlContent(user.login)}">
						<c:if test="${r.estado == 'pendiente'}">
							<td>${r.id}
							<td>${r.estado}
							<td>(${r.book_user.id}) ${r.book_user.books.title}
							<td>(${r.userIn.id}) ${r.userIn.login}
							<td>(${r.userOut.id}) ${r.userOut.login}
							<td><button class="accept" id="acp_${r.id}">Aceptar</button>
							<td><button class="cancel" id="can_${r.id}">Cancelar</button>
						</c:if>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<br>

<%@ include file="../fragments/footer.jspf"%>
