<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_bookuser.jspf"%>

<br>
<div id="data" align="center">
	<p>Mi_biblioteca
	<table>
		<tr>
			<th>Libros
			<th>Eliminar
		</tr>
		<tbody id="datadBookUser">
			<c:forEach items="${busers}" var="bu">
				<c:if test="${bu.owners.login == e:forHtmlContent(user.login)}">
					<tr>
						<td>${bu.books.title}
						<td><button class="bu" id="del_${bu.id}">eliminar</button>
					</tr>
				</c:if>

			</c:forEach>
		</tbody>
	</table>
</div>
<br>
<%@ include file="../fragments/footer.jspf"%>