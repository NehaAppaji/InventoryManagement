package beans;

import java.sql.ResultSet;

public interface DAO {
	public int putData(String query);
	public ResultSet getData(String query);
	public boolean isExists(String query);
	public void closeConnection();
}
