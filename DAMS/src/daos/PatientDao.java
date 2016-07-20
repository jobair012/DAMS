package daos;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import beans.DoctorBean;
import beans.PatientBean;

@Component
public class PatientDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/* CREATE NEW DOCTOR */
	@Transactional
	public void createPatient(PatientBean patient) {

		String encodedPassword = passwordEncoder.encode(patient.getPassword());

		String sqlForUsers = "INSERT INTO users(username, password, role, enabled) VALUES(?, ?, ?,?)";
		jdbcTemplate.update(sqlForUsers, patient.getUsername(), encodedPassword, patient.getRole(), patient.isEnabled());

		String sqlForDoctors = "INSERT INTO patients(fullAddress, contcatNo, dateOfBirth, email, gender, name, nationalId, birthCertificateId, username) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sqlForDoctors, patient.getFullAddress(), patient.getContactNumber(),
				patient.getDateOfBirth(), patient.getEmail(), patient.getGender(),
				patient.getName(), patient.getNationalId(), patient.getBirthCertificateId(), patient.getUsername());
	}

}
