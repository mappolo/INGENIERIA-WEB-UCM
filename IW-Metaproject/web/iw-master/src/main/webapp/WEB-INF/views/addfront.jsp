<%@ include file="../fragments/headerweb.jspf" %>
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
