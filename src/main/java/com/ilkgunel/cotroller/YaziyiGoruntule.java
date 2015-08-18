package com.ilkgunel.cotroller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import com.ilkgunel.entities.Yazilar;

@ManagedBean
@ViewScoped
public class YaziyiGoruntule {
	boolean gorunurluk;
	Yazilar yazilarObjesi;
	
	public void yaziyiDetaylandir(javax.faces.event.ActionEvent e)
	{
		gorunurluk=true;
		
	}
	
	public Yazilar getYazilarObjesi() {
		return yazilarObjesi;
	}
	
	public void setYazilarObjesi(Yazilar yazilarObjesi) {
		this.yazilarObjesi = yazilarObjesi;
	}
	
	public boolean isGorunurluk() {
		return gorunurluk;
	}
	
	public void setGorunurluk(boolean gorunurluk) {
		this.gorunurluk = gorunurluk;
	}
}
