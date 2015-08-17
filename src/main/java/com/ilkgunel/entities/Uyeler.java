package com.ilkgunel.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the uyeler database table.
 * 
 */
@Entity
@NamedQuery(name="Uyeler.findAll", query="SELECT u FROM Uyeler u")
public class Uyeler implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String kullaniciAdi;

	private String enabled;

	private String password;

	private String role;

	private int uyeId;

	private String yazarAdi;

	public Uyeler() {
	}

	public String getKullaniciAdi() {
		return this.kullaniciAdi;
	}

	public void setKullaniciAdi(String kullaniciAdi) {
		this.kullaniciAdi = kullaniciAdi;
	}

	public String getEnabled() {
		return this.enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getUyeId() {
		return this.uyeId;
	}

	public void setUyeId(int uyeId) {
		this.uyeId = uyeId;
	}

	public String getYazarAdi() {
		return this.yazarAdi;
	}

	public void setYazarAdi(String yazarAdi) {
		this.yazarAdi = yazarAdi;
	}

}