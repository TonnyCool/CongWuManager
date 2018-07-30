package util;

import java.sql.*;
public class DBConn {
    static{
        try{
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        }catch(Exception ex){
        }

    }

    public static Connection getConn(){
        try{
       	Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;database=cwgxs","sa","123");
 //     	Connection conn=DriverManager.getConnection("jdbc:odbc:wlbm");
            return conn;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    
    public static void main(String[] args) {
		getConn();
	}
    public static void close(Connection conn,Statement st,ResultSet rs){
    	if(rs!=null){
            try{
                rs.close();
            }catch(SQLException ex){
            }
       }
       if(st!=null){
           try {
               st.close();
           }catch(Exception ex){
           }
       }
       if(conn!=null){
           try{
               conn.close();
           }catch(Exception ex){
           }
       }
    }

}
