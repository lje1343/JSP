package jdbc;

public class GymDTO {
	private int gym_no;
	private String gym_name;
	private String gym_content;
	private float gym_latitude;
	private float gym_longtitude;
	private String gym_area;
	private int gym_salary;
	private boolean gym_secret;
	
	
	public int getGym_no() {
		return gym_no;
	}
	public String getGym_name() {
		return gym_name;
	}
	public String getGym_content() {
		return gym_content;
	}
	public float getGym_latitude() {
		return gym_latitude;
	}
	public float getGym_longtitude() {
		return gym_longtitude;
	}
	public String getGym_area() {
		return gym_area;
	}
	public int getGym_salary() {
		return gym_salary;
	}
	public boolean isGym_secret() {
		return gym_secret;
	}
	
	
	public GymDTO(int gym_no, String gym_name, String gym_content, float gym_latitude, float gym_longtitude,
			String gym_area, int gym_salary, boolean gym_secret) {
		super();
		this.gym_no = gym_no;
		this.gym_name = gym_name;
		this.gym_content = gym_content;
		this.gym_latitude = gym_latitude;
		this.gym_longtitude = gym_longtitude;
		this.gym_area = gym_area;
		this.gym_salary = gym_salary;
		this.gym_secret = gym_secret;
	}
	
	
	
	

}



