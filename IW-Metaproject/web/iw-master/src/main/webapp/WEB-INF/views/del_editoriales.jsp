<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_publisher.jspf"%>

<br>
<div align="center">
<H1>¡ATENCIÓN!</H1>
<p> Eliminación en cascada.</p>
<p> Mirar <a href="admin">aquí</a></p>
</div>
<div id="data" align="center">
<%@ include file="../fragments/busqueda.jspf"%>
<br>
<p>Editorial
	<table>
		<tr>
			<th>id
			<th>name
			<th>Eliminar
		</tr>
		<tbody id="dataPublisher">
			<c:forEach items="${publishers}" var="p">
				<tr>
					<td>${p.id}
					<td>${p.name}
					<td><button class="pu" id="del_${p.id}">eliminar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>
	<br>
<%@ include file="../fragments/footer.jspf" %>