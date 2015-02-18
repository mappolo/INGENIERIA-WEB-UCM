package es.fdi.iw.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries({
		@NamedQuery(name = "bookUserById",
			query = "select o from BookUser o where o.id = :idParam"),
		@NamedQuery(name = "bookUserByBook",
			query = "select o from BookUser o where o.books = :bookParam"),
		@NamedQuery(name = "delBookUser",
			query = "delete from BookUser bu where bu.id= :idParam"),
		@NamedQuery(name = "delRequestBU",
			query = "delete from Request r where r.userIn.id = :idParam")
})
public class BookUser {
	private long id;

	private String estado;
	private String comentario;

	private User owners;
	private Book books;
	private List<Request> Libreria;

	public BookUser() {

	}

	public static BookUser createBookUser(User owners, Book books,
			String estado, String comentario) {
		BookUser bu = new BookUser();
		bu.owners = owners;
		bu.books = books;
		bu.estado = estado;
		bu.comentario = comentario;
		return bu;
	}
	public static BookUser modBookUser(BookUser bu, Book books,
			String estado, String comentario) {
		bu.books = books;
		/*
		if(estado.length() > 4)
			bu.estado = estado;
		if(estado.length() > 4)
			bu.comentario = comentario;*/
		return bu;
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	@ManyToOne(cascade = { CascadeType.ALL }, targetEntity = User.class)
	public User getOwners() {
		return owners;
	}

	public void setOwners(User owners) {
		this.owners = owners;
	}

	@ManyToOne(cascade = { CascadeType.ALL }, targetEntity = Book.class)
	public Book getBooks() {
		return books;
	}

	public void setBooks(Book books) {
		this.books = books;
	}

	@OneToMany(cascade = { CascadeType.ALL }, targetEntity = Request.class)
	@JoinColumn(name = "book_user_id")
	public List<Request> getLibreria() {
		return Libreria;
	}

	public void setLibreria(List<Request> libreria) {
		Libreria = libreria;
	}
}