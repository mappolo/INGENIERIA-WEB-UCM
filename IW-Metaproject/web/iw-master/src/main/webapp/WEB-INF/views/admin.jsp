<%@ include file="../fragments/headerweb.jspf"%>
<div>
	<ul>
		<li>AUTHOR (id, name)
		<li>AUTHOR_BOOK (authors_id, escritos_id)
		<li>BOOK (id, isbn, title, year, publishers_id)
		<li>BOOKUSER (id, comentario, estado, books_id, owners_id)
		<li>GENRE (id, genre)
		<li>GENRE_BOOK (types_id, generos_id)
		<li>PERSON (id, mail, name, surname1, surname2, user_id)
		<li>PUBLISHER (id, name)
		<li>REQUEST (id, estado, book_user_id, userin_id, userout_id)
		<li>USER (id, hashedandsalted, login, role, salt)
	</ul>
</div>
<img src="${prefix}resources/images/BD.png"/>
<%@ include file="../fragments/footer.jspf"%>