<%@ include file="../fragments/headerweb.jspf" %>
<div id="principal" align="center">

<br>
<form method="POST" enctype="multipart/form-data" action="user" class="form-propio">
	<img src="user/photo?id=${user.id}" height="270px" width="270px" /> <br>
	Fichero a subir <input type="file" name="photo"><br />
	<input hidden="submit" name="id" value="${user.id}" />
	<button type="submit" name="upload" value="ok">Pulsa para subir esa foto</button>
</form>
<br>
	<div id="cajaModicar">

	<form action="${prefix}modUser" id="formularioLogin" method="POST" class="form-propio">
		<fieldset>
			<legend>Datos a modificar</legend>
			<label for="login">Nick</label> 
			<input type="hidden" id="source" name="source" value="${requestScope['javax.servlet.forward.servlet_path']}" />
			<input type="hidden" id="Oldlogin" name=Oldlogin value="${e:forHtmlContent(user.login)}" />
			<input type="text" id="login" name="login" placeholder="Login" value="${user.login}"/> 
			<br>
			<label for="password">Password</label>
			<input type="password" id="pass" name="pass" placeholder="Contraseña" /> 
			<br> 
			<label for="name">Nombre</label> 
			<input type="text" id="name" name="name" placeholder="Nombre" value="${user.persona.name}"/> 
			<br> 
			<label for="surname1">Apellido 1º</label> 
			<input type="text" id="surname1" name="surname1" placeholder="Apellido 1" value="${user.persona.surname1}"/> 
			<br> 
			<label for="surname2">Apellido 2º</label> 
			<input type="text" id="surname2" name="surname2" placeholder="Apellido 2" value="${user.persona.surname2}"/> 
			<br> 
			<label for="email">E-mail</label>
			<input type="text" id="email" name="email" placeholder="E-mail" value="${user.persona.mail}"/> 
			<br>
			<button name="submit" value="login" type="submit">Modificar</button>
			<c:if test="${not empty modError}">
			<br>
			<span class='errorLogin'>${modError}</span>
			</c:if>
		</fieldset>
	</form>
<br>
</div>
</div>
<%@ include file="../fragments/footer.jspf" %>
