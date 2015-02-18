package es.fdi.iw.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;


@Entity
@NamedQueries({
    @NamedQuery(name="bookById",
    	query="select o from Book o where o.id = :idParam"),
    @NamedQuery(name="bookByIsbn",
    	query="select o from Book o where o.isbn = :isbnParam"),
    @NamedQuery(name="bookByTitle",
    	query="select o from Book o where o.title = :titleParam"),
    @NamedQuery(name = "delBook",
    	query = "delete from Book o where o.id= :idParam"),
    @NamedQuery(name = "delBuB",
    	query = "delete from BookUser bu where bu.books.id = :idParam"),
    @NamedQuery(name = "delrequestB",
		query = "delete from Request r where r.id in"
					+ "(select re from Request re"
					+ " where re.book_user.books.id = :idParam)")
})

public class Book {
	private long id;
	private String isbn;
	private String title;
	private String year;
	
	
	private Publisher publisher;
	private List<Author> author;	
	private List<Genre> genre;
	private List<BookUser> biblioteca;
	
	public Book() {
		
	}
	
	public static Book createBook(String cover, String front, String isbn, String title, String year, 
			Publisher publisher){//, List<Author> author, List<Genre> genre, List<BookUser> biblioteca) {
		Book b = new Book();
		b.isbn = isbn;
		b.title = title;
		b.publisher = publisher;
		b.year = year;
		return b;
	}
	public static Book modBook(Book b, String isbn, String title, String year, 
			Publisher publisher){//, List<Author> author, List<Genre> genre, List<BookUser> biblioteca) {
		if(isbn.length()>7)
			b.isbn = isbn;
		if(title.length()>3)
			b.title = title;
		b.publisher = publisher;
		if(year.length()>3)
			b.year = year;
		return b;
	}
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}

	@Column(unique=true)
	public String getIsbn() {
		return isbn;
	}
	
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@ManyToOne(cascade=CascadeType.ALL,targetEntity=Publisher.class)
	public Publisher getPublishers() {
		return publisher;
	}

	public void setPublishers(Publisher publisher) {
		this.publisher = publisher;
	}

	@ManyToMany(cascade=CascadeType.ALL,targetEntity=Author.class, mappedBy="escritos")
	public List<Author> getAuthors() {
		return author;
	}

	public void setAuthors(List<Author> author) {
		this.author = author;
	}

	@ManyToMany(cascade=CascadeType.ALL,targetEntity=Genre.class, mappedBy="generos")
	public List<Genre> getTypes() {
		return genre;
	}

	public void setTypes(List<Genre> type) {
		this.genre = type;
	}
	
	@OneToMany(cascade=CascadeType.ALL,targetEntity=BookUser.class)
	@JoinColumn(name="books_id")
	public List<BookUser> getBiblioteca() {
		return biblioteca;
	}

	public void setBiblioteca(List<BookUser> biblioteca) {
		this.biblioteca = biblioteca;
	}


}
