package beans;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
 Connection connection;
 public Connection getConnection(){
	 try {
		 Class.forName(Constants.DRIVER);
		 connection=DriverManager.getConnection(Constants.URL,Constants.DB_USERNAME,Constants.DB_PASSWORD);
	 }
	 catch(Exception e) {
		 e.printStackTrace();
		 
	 }
	 return connection;
	 
 }
}
