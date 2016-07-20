package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import beans.AppointmentBean;

@Component
public class AppointmentDao {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void saveNewAppointmentRequest(AppointmentBean appointment) {
		
		String sql = "INSERT INTO appointment(requestedDate, expectedDate, doctors_username, patients_username, description) VALUES(?, ?, ?, ?, ?, ?)";
		
		jdbcTemplate.update(sql, appointment.getRequestedDate(), appointment.getExpectedDate(), appointment.getDoctors_username(), appointment.getPatients_username(), appointment.getDescription());

	}

	public List<AppointmentBean> getAllAppointments(String username) {
		
		String sql = "SELECT * FROM appointment WHERE patients_username = '" +username+ "' ORDER BY appointmentId DESC";
		
		return jdbcTemplate.query(sql, new RowMapper<AppointmentBean>(){

			@Override
			public AppointmentBean mapRow(ResultSet resultSet, int row) throws SQLException {
				
				AppointmentBean appointment = new AppointmentBean();
				
				appointment.setDescription(resultSet.getString("description"));
				appointment.setDoctors_username(resultSet.getString("doctors_username"));
				appointment.setExpectedDate(resultSet.getDate("expectedDate"));
				appointment.setRequestedDate(resultSet.getDate("requestedDate"));
				appointment.setStatus(resultSet.getString("status"));
				appointment.setWelcomeDate(resultSet.getDate("welcomeDate"));
				
				return appointment;
			}
			
			
		});
	}

	public List<AppointmentBean> getAllPendingAppointments(String username) {
		String sql = "SELECT * FROM appointment WHERE doctors_username = '" +username+ "' AND status = 'pending' ORDER BY appointmentId DESC";
		
		return jdbcTemplate.query(sql, new RowMapper<AppointmentBean>(){

			@Override
			public AppointmentBean mapRow(ResultSet resultSet, int row) throws SQLException {
				
				AppointmentBean appointment = new AppointmentBean();
				
				appointment.setAppointmentId(resultSet.getInt("appointmentId"));
				appointment.setDescription(resultSet.getString("description"));
				appointment.setPatients_username(resultSet.getString("patients_username"));
				appointment.setExpectedDate(resultSet.getDate("expectedDate"));
				appointment.setRequestedDate(resultSet.getDate("requestedDate"));
				appointment.setStatus(resultSet.getString("status"));
				appointment.setWelcomeDate(resultSet.getDate("welcomeDate"));
				
				return appointment;
			}
			
			
		});
	}

	public Object updateAppointments(AppointmentBean aptmnt) {
		
		
		String sql = "UPDATE appointment SET status = '"+aptmnt.getStatus()+ "' AND welcomeDate = '" +aptmnt.getWelcomeDate()+ "' WHERE appointmentId = "+aptmnt.getAppointmentId();
		
		System.out.println(sql);
		
		
		jdbcTemplate.update(sql);
		
		return null;
	}

}
