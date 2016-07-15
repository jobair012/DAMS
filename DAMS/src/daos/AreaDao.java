package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import beans.AreaBean;


@Component
public class AreaDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* SAVE NEW COUNTRY */
	public void saveArea(AreaBean area) {

		String sql = "INSERT INTO area(areaName) VALUES(?)";

		jdbcTemplate.update(sql, area.getAreaName());
	}
	
	public List<String> getAllArea() {

		String sql = "SELECT areaName FROM area";

		return jdbcTemplate.query(sql, new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet resultSet, int row) throws SQLException {

				return resultSet.getString("areaName");
			}

		});
	}
}
