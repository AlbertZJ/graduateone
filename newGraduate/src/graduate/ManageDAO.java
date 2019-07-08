package graduate;
 
import graduate.Manage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManageDAO {
	public List readFirstTitle(){
        List<Manage> list =new ArrayList<Manage>();
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
          String sql="select * from check_in";
           psmt=con.prepareStatement(sql);
             rs=psmt.executeQuery();
             
             while(rs.next())
            {
            	 String check_id=rs.getString("check_id");
                String check_start=rs.getString("check_start");
	              String check_end=rs.getString("check_end");
	              String stu_id=rs.getString("stu_id");
	              String tech_id=rs.getString("tech_id");
	              String check_num=rs.getString("check_num");
                 Manage tl=new Manage(check_id, check_start,  check_end, stu_id,  tech_id, check_num);
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
