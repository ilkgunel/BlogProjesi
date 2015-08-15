package com.ilkgunel.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the yazilar database table.
 * 
 */
@Entity
@NamedQuery(name="Yazilar.findAll", query="SELECT y FROM Yazilar y")
public class Yazilar implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int yaziId;

	private int yazarId;

	private String yaziBaslik;

	@Lob
	private String yaziIcerik;

	public Yazilar() {
	}

	public int getYaziId() {
		return this.yaziId;
	}

	public void setYaziId(int yaziId) {
		this.yaziId = yaziId;
	}

	public int getYazarId() {
		return this.yazarId;
	}

	public void setYazarId(int yazarId) {
		this.yazarId = yazarId;
	}

	public String getYaziBaslik() {
		return this.yaziBaslik;
	}

	public void setYaziBaslik(String yaziBaslik) {
		this.yaziBaslik = yaziBaslik;
	}

	public String getYaziIcerik() {
		return this.yaziIcerik;
	}

	public void setYaziIcerik(String yaziIcerik) {
		this.yaziIcerik = yaziIcerik;
	}

}