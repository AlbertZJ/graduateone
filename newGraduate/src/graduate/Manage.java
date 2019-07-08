package graduate;

public class Manage {
	/**
　　　　*下面这四个属性为数据库表中的四个属性
　　　　*/
	private String check_id; 
	public String getCheck_id() {
		return check_id;
	}


	public void setCheck_id(String check_id) {
		this.check_id = check_id;
	}


	public String getCheck_start() {
		return check_start;
	}


	public void setCheck_start(String check_start) {
		this.check_start = check_start;
	}


	public String getCheck_end() {
		return check_end;
	}


	public void setCheck_end(String check_end) {
		this.check_end = check_end;
	}


	public String getStu_id() {
		return stu_id;
	}


	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}


	public String getTech_id() {
		return tech_id;
	}


	public void setTech_id(String tech_id) {
		this.tech_id = tech_id;
	}


	public String getCheck_num() {
		return check_num;
	}


	public void setCheck_num(String check_num) {
		this.check_num = check_num;
	}


	private String check_start;
     private String check_end;     
	private String stu_id; 
    private String tech_id;
    private String check_num;   
      
      
	public Manage(String check_id, String check_start, String check_end, String stu_id, String tech_id, String check_num) {
          super();
          this.check_id = check_id;
          this.check_start = check_start;
         this.check_end = check_end;
         this.stu_id = stu_id;
         this.tech_id = tech_id;
         this.check_num = check_num;
     }
}
