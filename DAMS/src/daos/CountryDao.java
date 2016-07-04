package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import beans.CountryBean;


@Component
public class CountryDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* SAVE NEW COUNTRY */
	public void saveCountry(CountryBean country) {

		String sql = "INSERT INTO country(countryName) VALUES(?)";

		jdbcTemplate.update(sql, country.getCountryName());
	}

	public List<String> getAllCountry() {

		String sql = "SELECT countryName FROM country";

		return jdbcTemplate.query(sql, new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet resultSet, int row) throws SQLException {

				return resultSet.getString("countryName");
			}

		});
	}
}
