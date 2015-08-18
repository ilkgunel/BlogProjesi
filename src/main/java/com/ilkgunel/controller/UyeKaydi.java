package com.ilkgunel.controller;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.ilkgunel.entities.Uyeler;

@ManagedBean
@RequestScoped
public class UyeKaydi {
	Uyeler uyelerObjesi=new Uyeler();
	String kayitSonucMesaji="";//NullPointerException İle Karşılaşmamak İçin "" Ataması Yapıyoruz
	static int sonUyeKayitIdNo=10;
	
	public Uyeler getUyelerObjesi() {
		return uyelerObjesi;
	}
	
	public void setUyelerObjesi(Uyeler uyelerObjesi) {
		this.uyelerObjesi = uyelerObjesi;
	}
	
	public String getKayitSonucMesaji() {
		return kayitSonucMesaji;
	}
	
	public void setKayitSonucMesaji(String kayitSonucMesaji) {
		this.kayitSonucMesaji = kayitSonucMesaji;
	}
	
	public void uyeKaydiniYap() {
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("BlogProjesi");
		EntityManager em=emf.createEntityManager();
		
		//Şifreyi MD5 ile şifreleyip veritabanına kaydediyoruz.
	    try
	    {
	        MessageDigest messageDigestNesnesi = MessageDigest.getInstance("MD5");
	        messageDigestNesnesi.update(uyelerObjesi.getPassword().getBytes());
	        byte messageDigestDizisi[] = messageDigestNesnesi.digest();
	        StringBuffer sb16 = new StringBuffer();
	        for (int i = 0; i < messageDigestDizisi.length; i++) 
	        {
	        	sb16.append(Integer.toString((messageDigestDizisi[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        System.out.println("Parolanın Şifrelenmiş Hali:" + sb16.toString());
	        uyelerObjesi.setPassword(sb16.toString());
	    }
	    catch(NoSuchAlgorithmException ex){
	        System.err.println(ex);
	    }
	    
	    //Veritabanına kayıt olurken bazı özellikleri kendimiz atıyoruz. İlerki zamanda bu durum değişebilir. 
	    uyelerObjesi.setEnabled("1");
	    uyelerObjesi.setRole("ROLE_GUEST");
	    uyelerObjesi.setUyeId(sonUyeKayitIdNo);
		
		try {
			em.getTransaction().begin();
			em.persist(uyelerObjesi);
			em.getTransaction().commit();
			sonUyeKayitIdNo++;
			em.close();
			emf.close();
			kayitSonucMesaji="Kaydınız Başarı İle Tamamlandı";
		} catch (Exception e) {
			System.out.println("Bir Hata Meydana Geldi!");
			System.out.println("Hata"+e);
			kayitSonucMesaji="Kayıt Sırasında Bir Hata Meydana Geldi"+e;
		}
	}
}
