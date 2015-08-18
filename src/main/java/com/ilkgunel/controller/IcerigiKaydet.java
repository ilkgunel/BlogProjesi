package com.ilkgunel.controller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.ilkgunel.entities.Yazilar;

@ManagedBean
@SessionScoped
public class IcerigiKaydet {
	Yazilar gelenIcerik=new Yazilar();
	String kaydetmeIslemSonucu="";
	public void icerigiVeritabaninaKaydet()
	{
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("BlogProjesi");
		EntityManager em=emf.createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(gelenIcerik);
			em.getTransaction().commit();
			kaydetmeIslemSonucu="İçerik Başarı İle Veritabanına Kaydedildi!";
			em.close();
			emf.close();
		} 
		
		catch (Exception e) 
		{
			System.out.println("Bir Hata Meydana Geldi!");
			kaydetmeIslemSonucu="İçerik Kaydı Sırasında Bir Hata Meydana Geldi:"+e;
			System.out.println("Hata:"+e);
		}
		
	}
	
	public Yazilar getGelenIcerik() {
		return gelenIcerik;
	}
	
	public void setGelenIcerik(Yazilar gelenIcerik) {
		this.gelenIcerik = gelenIcerik;
	}
	
	public String getKaydetmeIslemSonucu() {
		return kaydetmeIslemSonucu;
	}
	
	public void setKaydetmeIslemSonucu(String kaydetmeIslemSonucu) {
		this.kaydetmeIslemSonucu = kaydetmeIslemSonucu;
	}
}
