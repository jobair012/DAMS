package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import beans.SpecializedSectionBean;


@Component
public class SpecializedSectionDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* SAVE NEW SpecializedSection */
	public void saveSpecializedSection(SpecializedSectionBean specializedSection) {

		String sql = "INSERT INTO specializedSection(speciality) VALUES(?)";

		jdbcTemplate.update(sql, specializedSection.getSpeciality());
	}

	public List<String> getAllSpecializedSection() {
		
		String sql = "SELECT speciality FROM specializedsection";
		
		return jdbcTemplate.query(sql, new RowMapper<String>(){

			@Override
			public String mapRow(ResultSet resultSet, int row) throws SQLException {
				
				return resultSet.getString("speciality");
			}
			
		});
	}
}
