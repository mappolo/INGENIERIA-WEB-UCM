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
    @NamedQuery(name="genreById",
    	query="select o from Genre o where o.id = :idParam"),
    @NamedQuery(name="genreByGenre",
    	query="select o from Genre o where o.genre = :genreParam"),
    @NamedQuery(name = "delGenre",
		query = "delete from Genre g where g.id= :idParam"),
//	@NamedQuery(name = "delGenreB",
//		query = "delete from Genre g where G.generos   ")
})
public class Genre {
	private long id;
	private String genre;
	private List<Book> generos; 
	
	public Genre() {	
	}	
	public static Genre createAuthor (List<Book> generos) {
		Genre g = new Genre();
		g.generos = generos;
		return g;
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	@ManyToMany(cascade={CascadeType.ALL},targetEntity=Book.class, fetch=FetchType.EAGER)
	public List<Book> getGeneros() {
		return generos;
	}
	public void setGeneros(List<Book> generos) {
		this.generos = generos;
	}

}
