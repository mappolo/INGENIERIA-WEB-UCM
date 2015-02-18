<%@ include file="../fragments/headerweb.jspf" %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<div id="cajaBook" align="center">

	<form action="${prefix}newBook" id="formularioLogin" method="POST" class="form-propio">
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
				<select id="genre" name="genre">
				<option value="">No definido</option>
				<c:forEach items="${genres}" var="g">
					<option value="${g.genre}">${g.genre}</option>
				</c:forEach>
			</select>
			<br>
			<label for="year">Año</label>
				<input type="text" id="year" name="year" placeholder="Año" /> <br>
			 AUTOR <br>
			<label for="authorN">Nombre</label>
			 	<input type="text" id="authorN"	name="authorN" placeholder="Nombre" /> <br>
			<label for="estado">Estado</label>
				<input type="text" id="estado" name="estado" placeholder="Estado" /> <br>
			<label for="comentario">Comentario...</label><br>
				<textarea cols="40" rows="5" id="comentario" name="comentario">Escriba aquí su opinión del libro...</textarea> <br>
			<button name="submit" value="login" type="submit">Registrar</button>
			<c:if test="${not empty BookError}">
				<br>
				<span class='errorLogin'>${BookError}</span>
			</c:if>
		</fieldset>
	</form>
</div>
<br>

<%@ include file="../fragments/footer.jspf" %>