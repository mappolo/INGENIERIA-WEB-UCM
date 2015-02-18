package es.fdi.iw.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity
@NamedQueries({
    @NamedQuery(name="PersonById",
        query="select o from Person o where o.id = :idParam"),
	@NamedQuery(name = "delPerson",
		query = "delete from Person pe where pe.id= :idParam"),
	@NamedQuery(name="PersonByUser",
		query="select p from Person p where p.user = :userParam")
})
public class Person {	
	private long id;
	
	private String name;
	private String surname1;
	private String surname2;
	private String mail;
	private User user;

	public Person() {
		
	}
	
	public static Person createPerson(String name, String surname1, String surname2, String mail, User user) {
		Person p = new Person();
		p.name = name;
		p.surname1 = surname1;
		p.surname2 = surname2;
		p.mail = mail;
		p.user = user;
		return p;
	}
	public static Person modPerson(Person p, String name, String surname1, String surname2, String mail, User user) {
		if(name.length()>3)
			p.name = name;
		if(surname1.length()>3)
			p.surname1 = surname1;
		if(surname2.length()>3)
			p.surname2 = surname2;
		if(mail.length()>3)
			p.mail = mail;
		p.user = user;
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
	@OneToOne(cascade={CascadeType.ALL})
	@JoinColumn(name="USER_ID", unique=true)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname1() {
		return surname1;
	}
	public void setSurname1(String surname1) {
		this.surname1 = surname1;
	}
		public String getSurname2() {
		return surname2;
	}
	public void setSurname2(String surname2) {
		this.surname2 = surname2;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
}