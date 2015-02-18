package es.fdi.iw.model;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries({
    @NamedQuery(name="PublisherById",
    	query="select o from Publisher o where o.id = :idParam"),
    @NamedQuery(name="PublisherByName",
    	query="select o from Publisher o where o.name = :NameParam"),
    @NamedQuery(name = "delPublisher",
		query = "delete from Publisher pu where pu.id= :idParam"),
	@NamedQuery(name = "delBookPu",
		query = "delete from Book b where b.publishers.id= :idParam"),
	@NamedQuery(name= "delBuPu",
		query = "delete from BookUser b where b.id in"
				+ "(select bu from BookUser bu"
				+ " where bu.books.publishers.id= :idParam)"),
	@NamedQuery(name = "delrequestPu",
			query = "delete from Request r where r.id in"
				+ "(select re from Request re"
				+ " where re.book_user.books.publishers.id= :idParam)")			
})


public class Publisher {
	private long id;
	private String name;
	private List<Book> editoriales;

	public Publisher() {
		
	}
	
	public static Publisher createPublisher(String name) {
		Publisher p = new Publisher();
		p.name = name;
		return p;
	}
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@OneToMany(cascade={CascadeType.ALL},targetEntity=Book.class)
	@JoinColumn(name="publishers_id") // <-- this avoids creating an extra User_Book table
	public List<Book> getEditoriales() {
		return editoriales;
	}
	public void setEditoriales(List<Book> editoriales) {
		this.editoriales = editoriales;
	}
}