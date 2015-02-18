<%@ include file="../fragments/headerweb.jspf"%>

<meta http-equiv="content-type" content="text/html; charset=Cp1252">
<!-- base href="http://apexdev.us.oracle.com:7778/pls/apx11w/" -->


<!-- start content-outer ........................................................................................................................START -->
<div id="content-outer" align="center">
	<!-- start content -->
	<div id="content">

		<!--  start page-heading -->
		<div id="page-heading">
			<h1>Género ${genre.genre}</h1>
		</div>
		<%@ include file="../fragments/busqueda.jspf"%>
		<!-- end page-heading -->
<!-- <div id="data"> -->
		<div id="table-content">
			<table>
				<tr>
					<th>Portada
					<th>Título
					<th>Año
					<th>Editorial
					<th>ISBN
				</tr>
				
				<tbody id="data">
					<c:forEach items="${books}" var="b">
						<c:forEach items="${genre.generos}" var="g">
							<c:if test="${b.id == g.id }">
								<tr class="alternate-row">
									<td><a href="${prefix}ejemplar/${b.id}" class="info">
										<img src="${prefix}book/photo?id=${b.id}" height="90px" width="70px"/></a>
									<td> <b>${b.title}</b>
									<td>${b.year}
									<%-- <td><a href="${prefix}publisher/${b.publishers.id}">${b.publishers.name}</a> --%>
									<td>${b.publishers.name}
									<td>${b.isbn}
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</tbody>
				
			</table>


		</div>
	<!-- </div> -->
		<div class="clear">&nbsp;</div>

	</div>
	<!--  end content -->
	<div class="clear">&nbsp;</div>
</div>
<!--  end content-outer........................................................END -->

<div class="clear">&nbsp;</div>



<%@ include file="../fragments/footer.jspf"%>