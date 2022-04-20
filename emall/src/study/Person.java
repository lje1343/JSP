package study;

public class Person {
	
	private int id = 20191004; /* private -> 밑에서 public선언해주면 접근 가능하다. */
	private String name = "홍길순";
	
	public Person() {
		
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	

}
