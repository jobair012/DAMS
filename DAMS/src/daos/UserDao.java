package daos;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class UserDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public boolean isUserExists(String username) {
		String sql = "SELECT count(*) FROM users WHERE username = ?";

		int count = jdbcTemplate.queryForObject(sql, new Object[] { username }, Integer.class);

		if (count > 0) {

			return true;
		}

		return false;
	}

}
