<%-- <%@ include file="../fragments/headerweb.jspf" %>
<%@ include file="../fragments/pide_autores.jspf"%>

<br>
<div id="principal" align="center">
<h1>Formulario para ver un libro</h1>

<table>
	<tr><td>campo</td><td>valor</td></tr>
	<tr><td>id</td><td>${book.id}</td></tr>
	<tr><td>description</td><td>${book.description}</td></tr>
	<tr><td>title<td>${book.title}</td></tr>
	<tr><td>authors</td><td><button id="b_${book.id}" class="pideAutores">Ver autores</button></td></tr>
</table>

<table border="1px">
		<tr>
			<th>id <!-- <td>cover -->
			<th>front
			<th>isbn
			<th>title
			<th>year
			<th>publisher
		</tr>
				<tr>
					<td>${book.id}<td>${b.cover}
					<td>${b.front}
					<td><img src="../book/photo?id=${book.id}" height="90px" width="70px" />
					<td>${book.isbn}
					<td>${book.title}
					<td>${book.year}
					<td>${book.publishers.name}</a>
				</tr>
	</table>
	<br>
	<h1>Usuarios con este libro</h1>
		<table border="1px">
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
						<td>${bu.estado}<td><a href="/publisher/${b.publishers.id}">${b.publishers.name}</a>
						<td>(${bu.owners.id})<a href="../bookUser/${bu.id}"> ${bu.owners.login}</a>
					</tr>
				</c:if>
			</c:forEach>

		</tbody>
	</table>	
</div>
<br>
<%@ include file="../fragments/footer.jspf" %>
 --%><%@ include file="../fragments/headerweb.jspf" %>
<%@ include file="../fragments/pide_autores.jspf"%>

<br>
<div id="principal" align="center">
<br>
<form method="POST" enctype="multipart/form-data" action="book" class="form-propio">
	<img src="book/photo?id=${book.id}" height="270px" width="270px" /><br>
	Fichero a subir <input type="file" name="photo"><br />
	<input hidden="submit" name="id" value="${book.id}" />
	<button type="submit" name="upload" value="ok">Pulsa para subir esa foto</button>
</form>
<br>
</div>
<br>
<%@ include file="../fragments/footer.jspf" %>