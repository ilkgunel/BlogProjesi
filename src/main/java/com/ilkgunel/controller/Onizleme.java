package com.ilkgunel.controller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.springframework.beans.factory.annotation.Autowired;

import com.ilkgunel.entities.Yazilar;

@ManagedBean
@SessionScoped
public class Onizleme {
	@Autowired
	private IcerigiKaydet icerigiKaydetObjesi;
	
	Yazilar yazilarObjesi=new Yazilar();
	
	public Yazilar getYazilarObjesi() {
		return yazilarObjesi;
	}
	
	public void setYazilarObjesi(Yazilar yazilarObjesi) {
		this.yazilarObjesi = yazilarObjesi;
	}
	
	public IcerigiKaydet getIcerigiKaydetObjesi() {
		return icerigiKaydetObjesi;
	}
	
	public void setIcerigiKaydetObjesi(IcerigiKaydet icerigiKaydetObjesi) {
		this.icerigiKaydetObjesi = icerigiKaydetObjesi;
	}
	
	public String onizlemeIsleminiYap()
	{
		yazilarObjesi.setYaziBaslik(icerigiKaydetObjesi.gelenIcerik.getYaziBaslik());
		yazilarObjesi.setYaziIcerik(icerigiKaydetObjesi.gelenIcerik.getYaziIcerik());
		
		System.out.println(yazilarObjesi.getYaziBaslik());
		System.out.println(yazilarObjesi.getYaziIcerik());
		return "onizleme.xhtml?faces-redirect=true";
	}
	
}
