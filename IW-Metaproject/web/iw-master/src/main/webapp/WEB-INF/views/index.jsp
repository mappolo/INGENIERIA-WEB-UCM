<%@ include file="../fragments/headerweb.jspf"%>

<!-- Main -->
<div id="main" class="shell">
	<!-- Sidebar -->
	<div id="sidebar">
		<ul class="categories">
			<li>
				<h4>Categorias</h4>
				<ul>
					<c:forEach items="${genres}" var="g">
						<li><a href="${prefix}categorias/${g.id}">${g.genre}</a>
						<c:set var="aux" scope="session" value="0"/>
						<c:forEach items="${g.generos}" var="l">
							<c:set var="aux" scope="session" value="${aux + 1}"/>
						</c:forEach>
						<c:if test="${ aux != 0 }">
							(<c:out value="${aux}"></c:out>)
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
	<!-- End Sidebar -->
	<!-- Content -->
	<div id="contentp">
		<!-- Products -->
		<div class="products">
			<h3>Libros</h3>
			<ul>
			<c:set var="pagini" scope="session" value="${pagination * 12}"/>
			<c:set var="pagfin" scope="session" value="${pagini + 11}"/>
			
			<c:forEach items="${books}"  var="b" begin="${pagini}" end="${pagfin}">
				<li>
				<c:set var="count" scope="session" value="${b.id}"/>
					<div class="product">
						<a href="${prefix}ejemplar/${b.id}" class="info">
						<img src="${prefix}book/photo?id=${b.id}" height="90px" width="70px" alt="" />
						<span class="book-name">${b.title}</span>
						<span class="author">Autores:</span>
						<span class="description">
						<c:forEach items="${authors}" var="a" >
							<c:forEach items="${a.escritos}" var="s">
							<c:if test="${b.id == s.id}">
								- ${a.name}<br>
							</c:if>
							</c:forEach>
						</c:forEach>
						</span></a>
					</div>
				</li>
			</c:forEach>
			</ul>
			
			<!-- End Products -->
		</div>

	
		<div class="cl">&nbsp;</div>
			<div align="center">
				<c:if test="${pagination > 0}">
					<a href="${prefix}index/${pagination-1}">Anterior</a>&nbsp;
				</c:if>
				<c:if test="${count%12 == 0 }">
					&nbsp;<a href="${prefix}index/${pagination+1}">Siguiente</a>
				</c:if>
			</div>
	</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
</div>
<!-- End Main -->




<%@ include file="../fragments/footer.jspf"%>