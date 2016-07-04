package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import beans.AdminBean;
import beans.DoctorBean;



@Component
public class AdminDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* CREATE NEW ADMIN */
	@Transactional
	public void createAdmin(AdminBean admin) {

		String encodedPassword = passwordEncoder.encode(admin.getPassword());

		String sqlForUsers = "INSERT INTO users(username, password, role, enabled) VALUES(?, ?, ?, ?)";
		jdbcTemplate.update(sqlForUsers, admin.getUsername(), encodedPassword, admin.getRole(), admin.isEnabled());

		String sqlForAdmins = "INSERT INTO admins(username, name, email, status) VALUES(?, ?, ?, ?)";
		jdbcTemplate.update(sqlForAdmins, admin.getUsername(), admin.getName(), admin.getEmail(), admin.getStatus());
	}

	public boolean isEmailExists(String email) {

		String sql = "SELECT count(*) FROM admins WHERE email = ?";

		int count = jdbcTemplate.queryForObject(sql, new Object[] { email }, Integer.class);

		if (count > 0) {
			return true;
		}

		return false;
	}

	public List<DoctorBean> getAllPendingDoctors() {

		String sql = "SELECT * FROM users, doctors WHERE users.username = doctors.username AND users.enabled = 0";

		return jdbcTemplate.query(sql, new RowMapper<DoctorBean>() {

			@Override
			public DoctorBean mapRow(ResultSet resultSet, int row) throws SQLException {

				DoctorBean doctor = new DoctorBean();

				doctor.setUsername(resultSet.getString("username"));
				doctor.setName(resultSet.getString("name"));
				doctor.setEmail(resultSet.getString("email"));
				doctor.setGender(resultSet.getString("gender"));
				doctor.setTitle(resultSet.getString("title"));
				doctor.setSpeciality(resultSet.getString("specializedSection_speciality"));
				doctor.setDateOfBirth(resultSet.getDate("dateOfBirth"));
				doctor.setDoctorsRegistrationNumber(resultSet.getString("doctorsRegistrationNumber"));
				doctor.setNationalId(resultSet.getString("nationalId"));
				doctor.setContactNumber(resultSet.getString("contactNumber"));

				return doctor;
			}

		});
	}
}
