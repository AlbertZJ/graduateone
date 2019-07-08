package graduate;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;
import graduate.Title;

public class TitleDAO {
public List readFirstTitle(){
	        List<Title> list =new ArrayList<Title>();
		         Connection con=null;
		        PreparedStatement psmt=null;
	         ResultSet rs=null;
	         try {
	             Class.forName("com.mysql.jdbc.Driver");
	         } catch (ClassNotFoundException e) {
	             e.printStackTrace();
	        }
		        
	         try {
	            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/graduate","root","123456");
	          String sql="select * from title";
	           psmt=con.prepareStatement(sql);
	             rs=psmt.executeQuery();
	             
	             while(rs.next())
	            {
	            	 String id=rs.getString("title_id");
	                String name=rs.getString("title_name");
		              String tech_id=rs.getString("tech_id");
		              String state=rs.getString("title_state");
		              String show=rs.getString("title_show");
		              String stu_id=rs.getString("stu_id");
		              String stu_title=rs.getString("stu_title");
		              String tech_title=rs.getString("tech_title");
		              String stu_file=rs.getString("stu_file");
		              String tech_file=rs.getString("tech_file");
	              
		              Title tl=new Title(id, name,  tech_id, state,  show, stu_id,stu_title,tech_title,stu_file,tech_file);
                list.add(tl);
	            }
		            
	        } catch (SQLException e) {
	           e.printStackTrace();
	        }finally
	         {
	           try {
	                 if(rs!=null)
	                 {
	                     rs.close();
	                }
	                if(psmt!=null)
	                {
	                    psmt.close();
	                 }
	                 if(con!=null)
	                 {
	                     con.close();
	                 }
	             } catch (SQLException e) {
	                  e.printStackTrace();
		              }
		         }
	         return list;
		      }
		    
}
