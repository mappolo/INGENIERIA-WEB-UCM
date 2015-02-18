package es.fdi.iw.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Random;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@NamedQueries({
		@NamedQuery(name = "userByLogin",
			query = "select u from User u where u.login = :loginParam"),
		@NamedQuery(name = "delUser",
			query = "delete from User u where u.id= :idParam"),
		@NamedQuery(name = "delrequestUin",
			query = "delete from Request r where r.userIn.id= :idParam"),
		@NamedQuery(name = "delrequestUout",
			query = "delete from Request r where r.userOut.id= :idParam"),
		@NamedQuery(name = "delBUU",
			query = "delete from BookUser bu where bu.owners.id= :idParam"),
		@NamedQuery(name = "delPersonU",
			query = "delete from Person pe where pe.user.id= :idParam")
		})

public class User {
	private long id;
	private String login;
	private String role;
	private String hashedAndSalted;
	private String salt;
	
	private Person persona;
	private List<BookUser> biblioteca;
	private List<Request> UserIn;
	private List<Request> UserOut;

	public User() {
	}

	public static User createUser(String login, String pass, String role) {
		User u = new User();
		u.login = login;
		Random r = new Random();

		// generate new, random salt; build hashedAndSalted
		byte[] saltBytes = new byte[16];
		r.nextBytes(saltBytes);
		u.salt = byteArrayToHexString(saltBytes);
		u.hashedAndSalted = generateHashedAndSalted(pass, u.salt);
		u.role = role;
		return u;
	}
	public static User modUser(User u,String login, String pass) {
		if (login.length()>3)
			u.login = login;
		if(pass.length()>3){
			Random r = new Random();
		// generate new, random salt; build hashedAndSalted
			byte[] saltBytes = new byte[16];
			r.nextBytes(saltBytes);
			u.salt = byteArrayToHexString(saltBytes);
			u.hashedAndSalted = generateHashedAndSalted(pass, u.salt);
		}
		return u;
	}
	public boolean isPassValid(String pass) {
		return generateHashedAndSalted(pass, this.salt).equals(hashedAndSalted);
	}

	/**
	 * Generate a hashed&salted hex-string from a user's pass and salt
	 * 
	 * @param pass
	 *            to use; no length-limit!
	 * @param salt
	 *            to use
	 * @return a string to store in the BD that does not reveal the password
	 *         even if the DB is compromised. Note that brute-force is possible,
	 *         but it will have to be targeted (ie.: use the same salt)
	 */
	public static String generateHashedAndSalted(String pass, String salt) {
		byte[] saltBytes = hexStringToByteArray(salt);
		byte[] passBytes = pass.getBytes();
		byte[] toHash = new byte[saltBytes.length + passBytes.length];
		System.arraycopy(passBytes, 0, toHash, 0, passBytes.length);
		System.arraycopy(saltBytes, 0, toHash, passBytes.length,
				saltBytes.length);
		return byteArrayToHexString(hash(toHash));
	}

	/**
	 * Converts a byte array to a hex string
	 * 
	 * @param b
	 *            converts a byte array to a hex string; nice for storing
	 * @return the corresponding hex string
	 */
	public static String byteArrayToHexString(byte[] b) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < b.length; i++) {
			sb.append(Integer.toString((b[i] & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}

	/**
	 * Converts a hex string to a byte array
	 * 
	 * @param hex
	 *            string to convert
	 * @return equivalent byte array
	 */
	public static byte[] hexStringToByteArray(String hex) {
		byte[] r = new byte[hex.length() / 2];
		for (int i = 0; i < r.length; i++) {
			String h = hex.substring(i * 2, (i + 1) * 2);
			r[i] = (byte) Integer.parseInt(h, 16);
		}
		return r;
	}

	/**
	 * Returns the SHA-1 of a byte array
	 * 
	 * @return
	 */
	public static byte[] hash(byte[] bytes) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-1");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return md.digest(bytes);
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
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getHashedAndSalted() {
		return hashedAndSalted;
	}

	public void setHashedAndSalted(String hashedAndSalted) {
		this.hashedAndSalted = hashedAndSalted;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String toString() {
		return "" + id + " " + login + " " + hashedAndSalted + " " + salt;
	}

	@OneToOne(cascade={CascadeType.ALL},optional=false, mappedBy="user")
	public Person getPersona() {
		return persona;
	}

	public void setPersona(Person persona) {
		this.persona = persona;
	}

	@OneToMany(cascade={CascadeType.ALL},targetEntity=BookUser.class)
	@JoinColumn(name="owners_id")
	public List<BookUser> getBiblioteca() {
		return biblioteca;
	}

	public void setBiblioteca(List<BookUser> biblioteca) {
		this.biblioteca = biblioteca;
	}

	@OneToMany(cascade={CascadeType.ALL},targetEntity=Request.class)
	@JoinColumn(name="userIn_id")
	public List<Request> getUserIn() {
		return UserIn;
	}

	public void setUserIn(List<Request> userIn) {
		UserIn = userIn;
	}

	@OneToMany(cascade={CascadeType.ALL},targetEntity=Request.class)
	@JoinColumn(name="userOut_id")
	public List<Request> getUserOut() {
		return UserOut;
	}

	public void setUserOut(List<Request> userOut) {
		UserOut = userOut;
	}
}