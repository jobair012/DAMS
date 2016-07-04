package daos;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import beans.DistrictBean;


@Component
public class DistrictDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* SAVE NEW DISTRICT */
	public void saveDistrict(DistrictBean district) {

		String sql = "INSERT INTO district(districtName) VALUES(?)";

		jdbcTemplate.update(sql, district.getDistrictName());
	}
}
