<%@ include file="../fragments/headerweb.jspf" %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<br>
<div id="cajaLogin" align="center">
	<form action="${prefix}newUser" id="formularioLogin" method="POST" class="form-propio">
		<fieldset>
			<legend>Nuevo usuario</legend>
			<label for="login">Nick</label> <input type="hidden"  id="source"
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

<%@ include file="../fragments/footer.jspf" %>