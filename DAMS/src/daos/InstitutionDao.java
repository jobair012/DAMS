package daos;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import beans.InstitutionBean;


@Component
public class InstitutionDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* SAVE NEW INSTITUTION */
	public void saveInstitution(InstitutionBean institution) {

		String sql = "INSERT INTO institution(instituteName, institutionsAcronym, country_countryName) VALUES(?, ?, ?)";

		jdbcTemplate.update(sql, institution.getInstituteName(), institution.getInstitutionsAcronym(),
				institution.getCountry_countryName());
	}
}
