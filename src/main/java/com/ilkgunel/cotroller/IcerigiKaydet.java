package com.ilkgunel.cotroller;

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
	
	public void icerigiVeritabaninaKaydet()
	{
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("BlogProjesi");
		EntityManager em=emf.createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(gelenIcerik);
			em.getTransaction().commit();
			em.close();
			emf.close();
		} 
		
		catch (Exception e) 
		{
			System.out.println("Bir Hata Meydana Geldi!");
			System.out.println("Hata:"+e);
		}
	}
	
	public Yazilar getGelenIcerik() {
		return gelenIcerik;
	}
	
	public void setGelenIcerik(Yazilar gelenIcerik) {
		this.gelenIcerik = gelenIcerik;
	}
}
