package com.ilkgunel.controller;

import java.util.ArrayList;
import java.util.List;

import com.ilkgunel.entities.Yazilar;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

@ManagedBean
@RequestScoped
public class YazilariGetir {
	List<Yazilar> veritabanindakiYazilar;
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("BlogProjesi");
	EntityManager em=emf.createEntityManager();
	
	@PostConstruct
	public void yazilariGetir()
	{
		veritabanindakiYazilar=new ArrayList<Yazilar>();
		TypedQuery<Yazilar> yazilarQuery=em.createQuery("select y from Yazilar y order by y.yaziId desc",Yazilar.class);
		veritabanindakiYazilar=yazilarQuery.getResultList();
	}
	
	public List<Yazilar> getVeritabanindakiYazilar() {
		return veritabanindakiYazilar;
	}
	
	public void setVeritabanindakiYazilar(List<Yazilar> veritabanindakiYazilar) {
		this.veritabanindakiYazilar = veritabanindakiYazilar;
	}
}
