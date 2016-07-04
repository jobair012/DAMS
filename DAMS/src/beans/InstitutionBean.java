package beans;

public class InstitutionBean {

	private String instituteName;
	private String institutionsAcronym;
	private String country_countryName;

	public InstitutionBean() {
	}

	public InstitutionBean(String instituteName, String institutionsAcronym, String country_countryName) {
		this.instituteName = instituteName;
		this.institutionsAcronym = institutionsAcronym;
		this.country_countryName = country_countryName;
	}

	public String getInstituteName() {
		return instituteName;
	}

	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}

	public String getInstitutionsAcronym() {
		return institutionsAcronym;
	}

	public void setInstitutionsAcronym(String institutionsAcronym) {
		this.institutionsAcronym = institutionsAcronym;
	}

	public String getCountry_countryName() {
		return country_countryName;
	}

	public void setCountry_countryName(String country_countryName) {
		this.country_countryName = country_countryName;
	}

}
