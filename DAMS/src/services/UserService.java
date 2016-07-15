package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daos.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDAO;

	public boolean isUserExists(String username) {
		
		return userDAO.isUserExists(username);
	}
}
