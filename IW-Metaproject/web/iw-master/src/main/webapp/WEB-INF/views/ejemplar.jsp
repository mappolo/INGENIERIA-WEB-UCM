<%@ include file="../fragments/headerweb.jspf"%>

<!-- start content-outer ........................................................................................................................START -->
<div id="content-outer" align="center">
	<!-- start content -->
	<div id="content">

		<!--  start page-heading -->
		<div id="page-heading">
			<h1>${book.title}</h1>
		</div>
		<table cellspacing="20px">
			<tr>
				<td>
					<img src="${prefix}book/photo?id=${book.id}" height="270px" width="210px"/>
				</td>
				<td>
				<ul>
					<li> Autores: <br>
					<c:forEach items="${authors}" var="a">
						<c:forEach items="${a.escritos}" var="s">
							<c:if test="${book.id == s.id}">
								- ${a.name}<br>
							</c:if>
						</c:forEach>
					</c:forEach> <br>
					<li> Editorial: ${book.publishers.name} <br>
					<li> Año: ${book.year} <br>
					<li> ISBN: ${book.isbn} <br>
					<li> Géneros: <br>		
					<c:forEach items="${genres}" var="g">
						<c:forEach items="${g.generos}" var="l">
							<c:if test="${book.id == l.id}">
								-${g.genre}
							<br>
							</c:if>
					    </c:forEach>
			</c:forEach>	
				</ul>
				</td>
			</tr>
		</table>
		<div class="clear">&nbsp;</div>
	</div>
	<!--  end content -->
	<div class="clear">&nbsp;</div>
	
	<c:if test="${not empty user}">
	<h1>Usuarios con este libro</h1>
	<table >
		<tr>
			<th>id
			<th>comentario
			<th>estado
			<th>owners_id
		</tr>
		<tbody id="data">
			<c:forEach items="${busers}" var="bu">
				<c:if test="${bu.books.title == book.title}">
					<tr>				
						<td>${bu.id}
						<td>${bu.comentario}
						<td>${bu.estado}<%-- <td><a href="/publisher/${b.publishers.id}">${b.publishers.name}</a> --%>
						<td>(${bu.owners.id})<a href="../bookUser/${bu.id}"> ${bu.owners.login}</a>
					</tr>	
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	</c:if>
	<br>
	<c:if test="${user.role=='admin'}">
	<div id="cajaModicarBook">

		<form action="${prefix}modBook" id="formularioLogin" method="POST">
		<fieldset>
			<legend>Modificar Libro</legend>
			<table>
				<tr>
					<td>
						<label for="title">Título</label>
					</td>
					<td>
						<input type="text" id="title" name="title" placeholder="Título" value="${book.title}"/>
					</td>
			</tr>
			<tr>
				<td>
					<label for="isbn">ISBN</label>
				</td>
				<td>
					<input type="text" id="isbn" name="isbn" placeholder="ISBN" value="${book.isbn}"/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="publisher">Editorial</label>
				</td>
				<td>
					<input type="hidden" id="Oldisbn" name="Oldisbn" value="${book.isbn}" />
				<input type="hidden" id="source" name="source" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
				<input type="hidden" id="user1" name="user1" value="${e:forHtmlContent(user.login)}"/>
				<input type="text" id="publisher" name="publisher" placeholder="publisher" value="${book.publishers.name}"/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="genre">Género</label>
				</td>
				<td>
					<select id="genre" name="genre" >
					<option value="">No definido</option>
					<c:forEach items="${genres}" var="g">
						<option value="${g.genre}">${g.genre}</option>
					</c:forEach>
			</select>
				</td>
			</tr>
			<tr>
				<td>
					<label for="year">Año</label>
				</td>
				<td>
					<input type="text" id="year" name="year" placeholder="Año" value="${book.year}"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					AUTOR
				</td>
			</tr>
			<tr>
				<td>
					<label for="authorN">Nombre</label>
				</td>
				<td>
					<input type="text" id="authorN"	name="authorN" placeholder="Nombre" />
				</td>
			</tr>
			<tr >
				<td colspan="2" align="center">
					<button name="submit" value="login" type="submit">Registrar</button>
				</td>
			</tr>
				<c:if test="${not empty BookError}">
					<span class='errorLogin'>${BookError}</span>
				</c:if>
		</table>
			<!-- <label for="estado">Estado</label>
				<input type="text" id="estado" name="estado" placeholder="Estado" /> <br>
			<label for="comentario">Comentario</label>
				<textarea cols="40" rows="5" id="comentario" name="comentario">Escriba aquí su opinión del libro...</textarea> <br> -->

		</fieldset>
	</form>
<br>
</div>
</c:if>
</div>


<!--  end content-outer........................................................END -->


<div class="clear">&nbsp;</div>

<%@ include file="../fragments/footer.jspf"%>