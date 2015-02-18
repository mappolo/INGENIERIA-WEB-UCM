package es.fdi.iw.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
	@NamedQuery(name = "requestById",
			query = "select o from Request o where o.id = :idParam"),
	@NamedQuery(name = "delRequest",
			query = "delete from Request r where r.id= :idParam")

})
//@Table(uniqueConstraints=@UniqueConstraint(columnNames={"userIn", "userOut","book_user"}))
public class Request {
	private long id;
	private User userIn;
	private User userOut;
	private BookUser book_user;
	private String estado;

public Request() {
		
	}
	
	public static Request createRequest(User userIn, User userOut, BookUser book_user){
		Request r = new Request();
		r.userIn = userIn;
		r.userOut = userOut;
		r.estado = "pendiente";
		r.book_user = book_user;
		return r;
	}
	public static Request acceptRequest(Request r){
		r.estado = "aceptado";
		return r;
	}
	public static Request cancelRequest(Request r){
		r.estado = "cancelado";
		return r;
	}
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@ManyToOne(cascade={CascadeType.ALL},targetEntity=User.class)
	public User getUserIn() {
		return userIn;
	}

	public void setUserIn(User userIn) {
		this.userIn = userIn;
	}

	@ManyToOne(cascade={CascadeType.ALL},targetEntity=User.class)
	public User getUserOut() {
		return userOut;
	}

	public void setUserOut(User userOut) {
		this.userOut = userOut;
	}

	@ManyToOne(cascade={CascadeType.ALL},targetEntity=BookUser.class)
	public BookUser getBook_user() {
		return book_user;
	}

	public void setBook_user(BookUser book_user) {
		this.book_user = book_user;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
}