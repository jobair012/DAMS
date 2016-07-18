package beans;

public class PhotoBean {

	private int photoId;
	private String photoUrl;
	private String username;

	public PhotoBean() {
	}

	public PhotoBean(int photoId, String photoUrl, String username) {
		this.photoId = photoId;
		this.photoUrl = photoUrl;
		this.username = username;
	}

	public int getPhotoId() {
		return photoId;
	}

	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
