package data.model;

public class Chapter {
	private int id;
	private String name;
	private String parent_path;
	
	
	public String getParent_path() {
		return parent_path;
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
	public void setParent_path(String parent_path) {
		this.parent_path = parent_path;
	}
	
}
