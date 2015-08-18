package com.ilkgunel.controller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.beans.factory.annotation.Autowired;

import com.ilkgunel.entities.Uyeler;

@ManagedBean
@SessionScoped
public class UyeBilgileri {
	@Autowired
	private IcerigiKaydet icerigiKaydetObjesi;
	
	private String girilenKullaniciAdi;
	Uyeler uyeBilgileriObjesi;
	
	
	public String getGirilenKullaniciAdi() {
		return girilenKullaniciAdi;
	}
	
	public void setGirilenKullaniciAdi(String girilenKullaniciAdi) {
		this.girilenKullaniciAdi = girilenKullaniciAdi;
	}
	
	public IcerigiKaydet getIcerigiKaydetObjesi() {
		return icerigiKaydetObjesi;
	}
	
	public void setIcerigiKaydetObjesi(IcerigiKaydet icerigiKaydetObjesi) {
		this.icerigiKaydetObjesi = icerigiKaydetObjesi;
	}
	
	public Uyeler getUyeBilgileriObjesi() {
		return uyeBilgileriObjesi;
	}
	
	public void setUyeBilgileriObjesi(Uyeler uyeBilgileriObjesi) {
		this.uyeBilgileriObjesi = uyeBilgileriObjesi;
	}
	
	public void bilgileriGetir()
	{
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("BlogProjesi");
		EntityManager em=emf.createEntityManager();
		
		em.getTransaction().begin();
		uyeBilgileriObjesi=em.find(Uyeler.class, girilenKullaniciAdi);
		icerigiKaydetObjesi.gelenIcerik.setYazarAdi(uyeBilgileriObjesi.getYazarAdi());
		
	}
}
