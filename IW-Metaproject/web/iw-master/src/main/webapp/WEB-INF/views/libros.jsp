<%@ include file="../fragments/headerweb.jspf"%>
<%@ include file="../fragments/deletes/del_book.jspf"%>

<!-- start content-outer ........................................................................................................................START -->
<div id="content-outer" align="center">
	<!-- start content -->
	<div id="content">
		<c:if test="${user.role=='admin'}">
			<div align="center">
			<H1>¡ATENCIÓN!</H1>
			<p> Eliminación en cascada.</p>
			<p> Mirar <a href="admin">aquí</a></p>
			</div>
		</c:if>
		<!--  start page-heading -->
		<div id="page-heading">
			<h1>Listado de libros</h1>
		</div>
		<%@ include file="../fragments/busqueda.jspf"%>
		
		<!-- end page-heading -->
<div id="data">
		<div id="table-content">
			<table >
				<tr>
					<th>id
					<th>Portada <!-- <th>front -->
					<th>ISBN
					<th>Título
					<th>Año
					<th>Editorial
					<c:if test="${user.role=='admin'}">
					<th>Eliminar</c:if>
				</tr>
				<tbody id="dataBook">
				<c:set var="pagini" scope="session" value="${pagination * 12}"/>
				<c:set var="pagfin" scope="session" value="${pagini + 11}"/>
					<c:forEach items="${books}" var="b" begin="${pagini}" end="${pagfin}">
					<c:set var="count" scope="session" value="${b.id}"/>
					
						<tr class="alternate-row">
							<td>${b.id}
							<td><a href="${prefix}ejemplar/${b.id}" class="info">
								<img src="${prefix}book/photo?id=${b.id}" height="90px" width="70px"/></a>
							<td>${b.isbn}
							<td><a href="${prefix}ejemplar/${b.id}" class="info">${b.title}</a>
							<td>${b.year}
							<%-- <td><a href="/publisher/${b.publishers.id}">${b.publishers.name}</a> --%>
							<td>${b.publishers.name}
							<c:if test="${user.role=='admin'}">
								<td><button class="bo" id="del_${b.id}">Eliminar</button>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</div>
		<div class="clear">&nbsp;</div>
			
	</div>
	<div align="center">
		<c:if test="${pagination > 0}">
			<a href="${prefix}libros/${pagination-1}">Anterior</a>&nbsp;
		</c:if>		
		<c:if test="${count%12 == 0 }">
			&nbsp;<a href="${prefix}libros/${pagination+1}">Siguiente</a>
		</c:if>
	</div>
	<!--  end content -->
	<div class="clear">&nbsp;</div>
	<br>
</div>
<!--  end content-outer........................................................END -->

<div class="clear">&nbsp;</div>

<%@ include file="../fragments/footer.jspf"%>