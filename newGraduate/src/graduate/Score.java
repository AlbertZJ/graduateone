package graduate;

public class Score {
	/**
　　　　*下面这四个属性为数据库表中的四个属性
　　　　*/
	private String usual_grade;
	private String score_id;
	public String getScore_id() {
		return score_id;
	}


	public void setScore_id(String score_id) {
		this.score_id = score_id;
	}


	public String getUsual_grade() {
		return usual_grade;
	}


	public void setUsual_grade(String usual_grade) {
		this.usual_grade = usual_grade;
	}


	public String getReply_grade() {
		return reply_grade;
	}


	public void setReply_grade(String reply_grade) {
		this.reply_grade = reply_grade;
	}


	public String getTotal_grade() {
		return total_grade;
	}


	public void setTotal_grade(String total_grade) {
		this.total_grade = total_grade;
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


	private String reply_grade;
	private String total_grade;
	private String stu_id;
     private String tech_id;     
  
	 
	public Score(String score_id,String usual_grade, String reply_grade, String total_grade, String tech_id, String stu_id) {
          super();
          this.score_id = score_id;
          this.usual_grade = usual_grade;
          this.reply_grade = reply_grade;
          this.total_grade = total_grade;

         this.tech_id = tech_id;
         this.stu_id = stu_id;
     }
}
