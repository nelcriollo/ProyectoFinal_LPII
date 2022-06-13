package log.ministerio.entidad;

public class TipoBien {
	
	private int cod_tipobien;
	private String nom_tipoBien;
	
	public TipoBien(int cod_tipobien, String nom_tipoBien) {
		this.cod_tipobien = cod_tipobien;
		this.nom_tipoBien = nom_tipoBien;
	}

	public TipoBien() {
	}

	public int getCod_tipobien() {
		return cod_tipobien;
	}

	public void setCod_tipobien(int cod_tipobien) {
		this.cod_tipobien = cod_tipobien;
	}

	public String getNom_tipoBien() {
		return nom_tipoBien;
	}

	public void setNom_tipoBien(String nom_tipoBien) {
		this.nom_tipoBien = nom_tipoBien;
	}

	
}
