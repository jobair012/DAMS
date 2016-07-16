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

import beans.DoctorBean;


@Component
public class DoctorsDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* CREATE NEW DOCTOR */
	@Transactional
	public void createDoctor(DoctorBean doctor) {

		String encodedPassword = passwordEncoder.encode(doctor.getPassword());

		String sqlForUsers = "INSERT INTO users(username, password, role, enabled) VALUES(?, ?, ?,?)";
		jdbcTemplate.update(sqlForUsers, doctor.getUsername(), encodedPassword, doctor.getRole(), doctor.isEnabled());

		String sqlForDoctors = "INSERT INTO doctors(fullAddress, area, contactNumber, dateOfBirth, doctorsRegistrationNumber, email, gender, name, nationalId, specializedSection_speciality, title, username) VALUES(?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?)";
		jdbcTemplate.update(sqlForDoctors, doctor.getFullAddress(), doctor.getArea(), doctor.getContactNumber(), doctor.getDateOfBirth(),
				doctor.getDoctorsRegistrationNumber(), doctor.getEmail(), doctor.getGender(), doctor.getName(),
				doctor.getNationalId(), doctor.getSpeciality(), doctor.getTitle(), doctor.getUsername());
	}

	public boolean isNationalIdExists(String nationalId) {

		String sql = "SELECT count(*) FROM doctors WHERE nationalId = ?";

		int count = jdbcTemplate.queryForObject(sql, new Object[] { nationalId }, Integer.class);

		if (count > 0) {

			return true;
		}

		return false;

	}

	public boolean isContactNumberExists(String contactNumber) {

		String sql = "SELECT count(*) FROM doctors WHERE contactNumber = ?";

		int count = jdbcTemplate.queryForObject(sql, new Object[] { contactNumber }, Integer.class);

		if (count > 0) {

			return true;
		}

		return false;

	}

	public boolean isEmailExists(String email) {

		String sql = "SELECT count(*) FROM doctors WHERE email = ?";

		int count = jdbcTemplate.queryForObject(sql, new Object[] { email }, Integer.class);

		if (count > 0) {
			return true;
		}

		return false;
	}

	public boolean isDoctorsRegistrationNumberExists(String doctorsRegistrationNumber) {

		String sql = "SELECT count(*) FROM doctors WHERE doctorsRegistrationNumber = ?";

		int count = jdbcTemplate.queryForObject(sql, new Object[] { doctorsRegistrationNumber }, Integer.class);

		if (count > 0) {
			return true;
		}

		return false;
	}
	
	public List<String> getAllDoctorsName(String term){
		
		String sql = "SELECT name FROM doctors WHERE name LIKE '" +term+ "%'";
		
		return jdbcTemplate.query(sql,  new RowMapper<String>(){

			@Override
			public String mapRow(ResultSet resultSet, int row) throws SQLException {
				
				return resultSet.getString("name");
			}});
	}

	public List<DoctorBean> getAllDoctors(String doctorsName, String area, String specializedSection, String gender) {
		
		String sql = "SELECT * FROM doctors WHERE name = '" +doctorsName+ "' OR specializedSection_speciality = '" +specializedSection+ "' OR gender = '" +gender+ "' OR area = '"+area+"'";
				
		return jdbcTemplate.query(sql, new RowMapper<DoctorBean>(){

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
				doctor.setFullAddress(resultSet.getString("fullAddress"));
				doctor.setArea(resultSet.getString("area"));

				return doctor;
			}
			
			
		});
	}
	
public List<DoctorBean> getAllDoctors() {
		
		String sql = "SELECT * FROM doctors";
				
		return jdbcTemplate.query(sql, new RowMapper<DoctorBean>(){

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
				doctor.setFullAddress(resultSet.getString("fullAddress"));
				doctor.setArea(resultSet.getString("area"));

				return doctor;
			}
			
			
		});
	}
}
