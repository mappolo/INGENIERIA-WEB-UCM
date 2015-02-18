<%@ include file="../fragments/headerweb.jspf"%>

<meta http-equiv="content-type" content="text/html; charset=Cp1252">
<!-- base href="http://apexdev.us.oracle.com:7778/pls/apx11w/" -->

<%@ include file="../fragments/busqueda.jspf"%>
<%@ include file="../fragments/deletes/del_book.jspf"%>
<%@ include file="../fragments/deletes/del_request.jspf"%>
<%@ include file="../fragments/deletes/del_bookuser.jspf"%>
<%@ include file="../fragments/deletes/del_person.jspf"%>
<%@ include file="../fragments/deletes/del_user.jspf"%>
<%@ include file="../fragments/deletes/del_publisher.jspf"%>
<%@ include file="../fragments/deletes/del_genre.jspf"%>
<%@ include file="../fragments/deletes/del_author.jspf"%>
<%@ include file="../fragments/peticiones.jspf"%>
<!-- por implementar -->
<%@ include file="../fragments/deletes/del_genre_book.jspf"%>
<%@ include file="../fragments/deletes/del_author_book.jspf"%>
<br>
<div id="cajaLogin">

	<form action="${prefix}newUser" id="formularioLogin" method="POST">
		<fieldset>
			<legend>Nuevo usuario</legend>
			<label for="login">Nick</label> <input type="hidden" id="source"
				name="source"
				value="${requestScope['javax.servlet.forward.servlet_path']}" /> <input
				type="text" id="login" name="login" placeholder="Login" /> <br>
			<label for="password">Password</label> <input type="password"
				id="pass" name="pass" placeholder="Contraseña" /> <br> <label
				for="name">Nombre</label> <input type="text" id="name" name="name"
				placeholder="Nombre" /> <br> <label for="surname1">Apellido
				1º</label> <input type="text" id="surname1" name="surname1"
				placeholder="Apellido 1" /> <br> <label for="surname2">Apellido
				2º</label> <input type="text" id="surname2" name="surname2"
				placeholder="Apellido 2" /> <br> <label for="email">E-mail</label>
			<input type="text" id="email" name="email" placeholder="E-mail" /> <br>
			<button name="submit" value="login" type="submit">Registrar</button>
			<c:if test="${not empty registerError}">
				<br>
				<span class='errorLogin'>${registerError}</span>
			</c:if>
		</fieldset>
	</form>

</div>

<br>

<div id="cajaBook">

	<form action="${prefix}newBook" id="formularioLogin" method="POST">
		<fieldset>
			<legend>Nuevo Libro</legend>
			<label for="title">Título</label>
				<input type="text" id="title" name="title" placeholder="Título" /><br>
			<label for="isbn">ISBN</label>
				<input type="text" id="isbn" name="isbn" placeholder="ISBN" /> <br>
			<label for="publisher">Editorial</label>
				<input type="hidden" id="source" name="source" value="${requestScope['javax.servlet.forward.servlet_path']}" />
				<input type="hidden" id="user1" name="user1" value="${e:forHtmlContent(user.login)}" />
				<input type="text" id="publisher" name="publisher" placeholder="publisher" /> <br>
			<label for="genre">Género</label>
				<!-- <input type="text" id="genre" name="genre" placeholder="Género" /> --> <br>
			<label for="year">Año</label>
				<input type="text" id="year" name="year" placeholder="Año" /> <br>
			 AUTOR <br>
			<label for="authorN">Nombre</label>
			 	<input type="text" id="authorN"	name="authorN" placeholder="Nombre" /> <br>
			<label for="estado">Estado</label>
				<input type="text" id="estado" name="estado" placeholder="Estado" /> <br>
			<label for="comentario">Comentario</label>
				<textarea cols="40" rows="5" id="comentario" name="comentario">Escriba aquí su opinión del libro...</textarea> <br>
			<select id="genre" name="genre">
				<option value="">No definido</option>
				<c:forEach items="${genres}" var="g">
					<option value="${g.genre}">${g.genre}</option>
				</c:forEach>
			</select>

			<!-- <script>
				var availableTags = JSON.parse('${genresJSON}');
				$(function() {
					$("#tags").autocomplete({
						source : availableTags
					});
				});
			</script>
			<div class="ui-widget">
				<label for="tags">Tags: </label> <input id="tags" />
			</div> -->
			<button name="submit" value="login" type="submit">Registrar</button>
			<c:if test="${not empty BookError}">
				<br>
				<span class='errorLogin'>${BookError}</span>
			</c:if>
		</fieldset>
	</form>
</div>

<br>

<div id="cajaRequest">
	<form action="${prefix}newRequest" id="formularioLogin" method="POST">
		<fieldset>
			<legend>Nueva Petición</legend>
			<input type="hidden" id="source" name="source"
				value="${requestScope['javax.servlet.forward.servlet_path']}" /> <input
				type="hidden" id="userI" name="userI"
				value="${e:forHtmlContent(user.login)}" /> <label for="title">Título</label>
			<input type="text" id="title" name="title" placeholder="Título" /> <br>
			<label for="state">Estado</label> <input type="text" id="state"
				name="state" placeholder="Estado" />
			<button name="submit" value="login" type="submit">Registrar</button>
		</fieldset>
	</form>
</div>

<div id="data">
	<br>
	<p>Usuarios
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>login
			<td>rol
			<td>hash
			<td>salt
		</tr>
		<tbody id="dataUser">
			<c:forEach items="${users}" var="u">
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

	<br>
	<p>Libros
	<table border="0" cellpadding="0" cellspacing="0" id="content-table">
		<tr>
			<td>id <!-- <td>cover -->
			<td>front
			<td>isbn
			<td>title
			<td>year
			<td>publisher
		</tr>
		<tbody id="dataBook">
			<c:forEach items="${books}" var="b">
				<tr>
					<td>${b.id}<%-- <td>${b.cover}
					<td>${b.front} --%>
					<td><img src="book/photo?id=${b.id}" height="90px"
						width="90px" />
					<td>${b.isbn}
					<td>${b.title}
					<td>${b.year}
					<td><a href="/publisher/${b.publishers.id}">${b.publishers.name}</a>
					<td><button class="bo" id="del_${b.id}">eliminar</button>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<p>Editorial
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>name
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
	<br>
	<p>Autores
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>name
		</tr>
		<tbody id="dataAuthor">
			<c:forEach items="${authors}" var="a">
				<tr>
					<td>${a.id}
					<td>${a.name}
					<td><button class="au" id="del_${a.id}">eliminar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<br>
	<p>Libros_Usuarios
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>comentario
			<td>estado
			<td>books_id
			<td>owners_id
		</tr>
		<tbody id="datadBookUser">
			<c:forEach items="${busers}" var="bu">
				<tr>
					<td>${bu.id}
					<td>${bu.comentario}
					<td>${bu.estado}<%-- <td><a href="/publisher/${b.publishers.id}">${b.publishers.name}</a> --%>
					<td>(${bu.books.id}) ${bu.books.title}
					<td>(${bu.owners.id}) ${bu.owners.login}
					<td><button class="bu" id="del_${bu.id}">eliminiar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<br>
	<p>Género
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>genre
		</tr>
		<tbody id="dataGenre">
			<c:forEach items="${genres}" var="g">
				<tr>
					<td>${g.id}
					<td>${g.genre}
					<td><button class="ge" id="del_${g.id}">eliminar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<br>
	
	<p>Peticiones
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>estado
			<td>book_user_id
			<td>userIn_id
			<td>userOut_id
		</tr>
		<tbody id="dataRequest">
			<c:forEach items="${requests}" var="r">
				<tr>
					<td>${r.id}
					<td>${r.estado}
					<td>(${r.book_user.id}) ${r.book_user.books.title}
					<td>(${r.userIn.id}) ${r.userIn.login}
					<td>(${r.userOut.id}) ${r.userOut.login}
					<td><button class="re" id="del_${r.id}">eliminar</button>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<br>
	<p>Personas
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>email
			<td>name
			<td>surname1
			<td>surname2
			<td>user_id
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
	<br>
	<p>Autores_libros
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>authors_id
			<td>escritos_id
		</tr>
		<tbody id="delAuthorB">
			<c:forEach items="${authors}" var="a">
				<c:forEach items="${a.escritos}" var="b">
					<tr>
						<td>(${a.id}) ${a.name}
						<td>(${b.id}) ${b.title}
						<td><button class="au_b" id="del_${b.id}">x</button>
					</tr>
				</c:forEach>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<p>Géneros_libros
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>Género
			<td>Libro
		</tr>
		<tbody id="dataGenreB">
			<c:forEach items="${genres}" var="g">
				<c:forEach items="${g.generos}" var="l">
					<tr>
						<td>(${g.id}) ${g.genre}
						<td>(${l.id}) ${l.title}
						<td><button class="ge_b" id="del_${l.id}">x</button>
					</tr>
				</c:forEach>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<p>Mi_biblioteca
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>Libros
		</tr>
		<tbody id="data">
		<c:forEach items="${busers}" var="bu">
			<tr>
				<c:if test="${bu.owners.login == e:forHtmlContent(user.login)}">
					<td>${bu.books.title}
					<td><button class="x" id="del_${bu.id}">x</button>
				</c:if>
			</tr>

		</c:forEach>
		</tbody>
	</table>
	<br>
	<p> Mis_Peticiones_enviadas
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>estado
			<td>book_user_id
			<td>userIn_id
			<td>userOut_id
			<td>email
		</tr>
		<tbody id="data">
			<c:forEach items="${requests}" var="r">
				<tr>
					<c:if test="${r.userOut.login == e:forHtmlContent(user.login)}">
					<td>${r.id}
					<td>${r.estado}
					<td>(${r.book_user.id}) ${r.book_user.books.title}
					<td>(${r.userIn.id}) ${r.userIn.login}
					<td>(${r.userOut.id}) ${r.userOut.login}
					<td><c:if test="${r.estado == 'aceptado'}">
						${r.userIn.persona.name}: ${r.userIn.persona.mail}
					</c:if>
					<td><button class="x" id="del_${r.id}">x</button>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
		<p> Mis_Peticiones_recibidas
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>estado
			<td>book_user_id
			<td>userIn_id
			<td>userOut_id
		</tr>
		<tbody id="data">
			<c:forEach items="${requests}" var="r">
				<tr>
					<c:if test="${r.userIn.login == e:forHtmlContent(user.login)}">
					<td>${r.id}
					<td>${r.estado}
					<td>(${r.book_user.id}) ${r.book_user.books.title}
					<td>(${r.userIn.id}) ${r.userIn.login}
					<td>(${r.userOut.id}) ${r.userOut.login}
					<td><button class="x" id="del_${r.id}">x</button>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
			<p> Mis_Peticiones_recibidas_pendientes
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>estado
			<td>book_user_id
			<td>userIn_id
			<td>userOut_id
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
	<br>
	
	<div id="cajaModicar">

	<form action="${prefix}modUser" id="formularioLogin" method="POST">
		<fieldset>
			<legend>Datos a modificar</legend>
			<label for="login">Nick</label> 
			<input type="hidden" id="source" name="source" value="${requestScope['javax.servlet.forward.servlet_path']}" />
			<input type="hidden" id="Oldlogin" name=Oldlogin value="${e:forHtmlContent(user.login)}" />
			<input type="text" id="login" name="login" placeholder="Login" /> 
			<br>
			<label for="password">Password</label>
			<input type="password" id="pass" name="pass" placeholder="Contraseña" /> 
			<br> 
			<label for="name">Nombre</label> 
			<input type="text" id="name" name="name" placeholder="Nombre" /> 
			<br> 
			<label for="surname1">Apellido 1º</label> 
			<input type="text" id="surname1" name="surname1" placeholder="Apellido 1" /> 
			<br> 
			<label for="surname2">Apellido 2º</label> 
			<input type="text" id="surname2" name="surname2" placeholder="Apellido 2" /> 
			<br> 
			<label for="email">E-mail</label>
			<input type="text" id="email" name="email" placeholder="E-mail" /> 
			<br>
			<button name="submit" value="login" type="submit">Modificar</button>
			<c:if test="${not empty modError}">
			<br>
			<span class='errorLogin'>${modError}</span>
			</c:if>
		</fieldset>
	</form>

</div>
<p>Mis datos
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td>id
			<td>email
			<td>name
			<td>surname1
			<td>surname2
			<td>user_id
		</tr>
		<tbody id="data">
			<c:forEach items="${persons}" var="pe">
				<tr>
				<c:if test="${pe.user.login == e:forHtmlContent(user.login)}">
					<td>${pe.id}
					<td>${pe.mail}
					<td>${pe.name}
					<td>${pe.surname1}
					<td>${pe.surname2}
					<td>(${pe.user.id}) ${pe.user.login}

					</c:if>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<br>
</div>
<%@ include file="../fragments/footer.jspf"%>