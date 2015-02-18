package es.fdi.iw.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
		@NamedQuery(name = "authorById",
			query = "select o from Author o where o.id = :idParam"),
		@NamedQuery(name = "authorByName",
			query = "select o from Author o where o.name = :nameParam"),
		@NamedQuery(name = "delAuthor",
			query = "delete from Author A where A.id= :idParam")
})

public class Author {
	private long id;
	private String name;
	private List<Book> escritos;

	public Author() {

	}

	public static Author createAuthor(String name, List<Book> escritos) {
		Author a = new Author();
		a.name = name;
		a.escritos = escritos;
		return a;
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(unique = true)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToMany(cascade = { CascadeType.ALL }, targetEntity = Book.class, fetch = FetchType.EAGER)
	public List<Book> getEscritos() {
		return escritos;
	}

	public void setEscritos(List<Book> escritos) {
		this.escritos = escritos;
	}
}