package daos;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import beans.DegreeBean;

@Component
public class DegreeDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* SAVE NEW DEGREE */
	public void saveDegree(DegreeBean degree) {

		String sql = "INSERT INTO degree(degreeName) VALUES(?)";

		jdbcTemplate.update(sql, degree.getDegreeName());
	}
}
