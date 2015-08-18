-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 18 Ağu 2015, 16:25:56
-- Sunucu sürümü: 5.6.25
-- PHP Sürümü: 5.5.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `BlogProjesi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `persistent_logins`
--

CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `username` varchar(64) COLLATE utf8_turkish_ci NOT NULL,
  `series` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `token` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `last_used` varchar(45) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `userroles`
--

CREATE TABLE IF NOT EXISTS `userroles` (
  `id` int(11) NOT NULL,
  `role` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `kullaniciAdi` varchar(45) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `userroles`
--

INSERT INTO `userroles` (`id`, `role`, `kullaniciAdi`) VALUES
(1, 'ROLE_GUEST', 'ilkay.gunel'),
(2, 'ROLE_GUEST', 'ilkgunel'),
(3, 'ROLE_GUEST', 'turgunel');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE IF NOT EXISTS `uyeler` (
  `uyeId` int(11) NOT NULL,
  `kullaniciAdi` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `enabled` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `role` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `yazarAdi` varchar(45) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`uyeId`, `kullaniciAdi`, `password`, `enabled`, `role`, `yazarAdi`) VALUES
(2, 'ilkay.gunel', 'd666f4b37d107223d3a9d6351737db80', '1', 'ROLE_GUEST', 'İlkay Günel'),
(1, 'ilkgunel', '827ccb0eea8a706c4c34a16891f84e7b', '1', 'ROLE_GUEST', 'İlkay Günel'),
(9, 'turgunel', '5e520fc7b36813a2006b84b7f9d6e7bf', '1', 'ROLE_GUEST', 'Turgay Günel'),
(8, 'turgunel34', '5e520fc7b36813a2006b84b7f9d6e7bf', '1', 'ROLE_GUEST', 'Turgay Günel');

--
-- Tetikleyiciler `uyeler`
--
DELIMITER $$
CREATE TRIGGER `addUserRole` AFTER INSERT ON `uyeler`
 FOR EACH ROW insert into BlogProjesi.userroles(role,kullaniciAdi) values(NEW.role,NEW.kullaniciAdi)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazilar`
--

CREATE TABLE IF NOT EXISTS `yazilar` (
  `yaziId` int(11) NOT NULL,
  `yaziBaslik` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `yaziIcerik` mediumtext COLLATE utf8_turkish_ci,
  `yazarAdi` varchar(40) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yazilar`
--

INSERT INTO `yazilar` (`yaziId`, `yaziBaslik`, `yaziIcerik`, `yazarAdi`) VALUES
(1, 'JSF Giriş', 'JSF Nedir? JSF Javanın Standart Web Çatısıdır. Bileşen Tabanlıdır. 3.parti kütüphanelerle desteklenir. ', 'İlkay Günel'),
(2, 'JSF Form Bileşenleri', 'JSF''de form tasarlarken kullanılabilecek bir çok form bileşeni vardır. h:form etiketi ile form tasarımı başlatılır. h:outputText ile ekrana veri yazdırılır. h:inputText ile kullanıcıdan bilgi alınır.', 'İlkay Günel'),
(3, 'JSF ManagedBean', 'JSF''nin back-end tarafı olan Java sınıfları Managed Bean olarak adlandırılır. Özel olarak @ManagedBean notasyonu ile belilenebilir ya da faces-config dosyasına yazılabilir.', 'İlkay Günel'),
(4, 'Swift Programlama Dili', 'Apple WWDC etkinliğinde Swift isimli programlama dilini tanıttı. iOS ve OS X uygulamalarını yazarken kullanabileceğimiz bu dili şirket, “daha yenilikçi ve daha üstün performanslı” olarak niteliyor.\n\nBizde sizinle beraber iOS programlama yazılarım altında, Objective C’nin yanı sıra, Swift programlama dili ile iOS uygulaması geliştirmeyi öğreneceğiz.', 'İlkay Günel'),
(5, 'Android Uygulama Geliştirme – Giriş\nAndroid Uygula', 'Bu konudaki ilk yazımda Android’in ne olduğundan, neden bu alanda olmamız gerektiğinden ve Android işletim sistemine uygun uygulamalar geliştirebilmek için nelere gereksinim duyduğumuzdan bahsedeceğim.\n\nAndroid Nedir?\n\nAndroid deyince tanımlanması gereken aslında Android işletim sistemidir. Bu işletim sistemi 2007 yılında Google ve Open Handset Alliance tarafından kodlanmış, temeli Linux işletim sistemine dayanan, mobil cihazlar(cep telefonları, tabletler vb.) için geliştirilmiş açık kaynak kodlu bir işletim sistemidir.\n\nNeden Android? Yukarıdaki grafikte görüldüğü gibi Android işletim sistemi piyasaya çıktığı andan itibaren hızlı bir şekilde pazardaki payını artırarak bu pazardaki en büyük paya sahip işletim sistemi haline gelmiştir. Bu artışı Android uygulamalarda da görmek mümkündür. Bu artışlar sonucunda artık neredeyse bütün firmalar son kullanıcıya ulaşmak için bu platformu da kullanmaktadırlar.\n\nBu açıklamaları yaptıktan sonra bir de gereksinimlere bakalım.\n\nGereksinim Listesi:\n\nBireysel;\n\nOrta düzeyde bir programlama becerisi\nJava dilinin temellerini kavramış olmak\nDonanımsal;\n\nHerhangi bir bilgisayar (günümüzde Eclipse ve Java’yı kaldıramayacak bilgisayar kalmadığını varsayıyorum :) )\nYazılımsal;\n\nJDK (Java Development Kit)\nIDE (Integrated Development Environment) => Genellikle Eclipse IDE kullanılıyor.\nAndroid SDK\nBu yazılımların hepsi ücretsiz olduğu için Android uygulama geliştirmenin size bir masrafı yok. Son yıllarda bu konu üzerine Türkçe kaynakların da artmış olduğunu düşünürsek bu alanda kendini geliştirmek isteyenlerin işi oldukça kolay diyebilirim. Eğer İleri düzeyde bir Android uygulama geliştiricisi olmak istiyorsanız bu gereksinimlere ek olarak okuduğunuzu anlayacak kadarda olsa İngilizce bilmeniz gerektiğini söyleyebilirim. Çünkü bir çok alanda olduğu gibi bu alanda da kaynakların çoğunluğu İngilizce.\n\nEğer ‘Ben de bu alanda var olmak istiyorum.’ diyorsanız, bu alandaki yazılarım sizleri bekliyor olacak. :)', 'İlkay Günel'),
(6, 'ASP.NET MVC Nedir?', '<p>MVC’nin ne olduğunu, ne olmadığını <a href="http://www.ahmetcigsar.com/yazilim/yazilim-muhendisligi/mvc-nedir/" target="_blank">önceki yazımda</a> kısaca anlattım. MVC <span style="text-decoration: underline;">mimarisi</span> hakkında konuşulacak <span style="text-decoration: underline;">teorik bilgi</span>\r\n zaten belirli olduğundan kısa tuttum fakat bu yazı ve bu yazıdan \r\nitibaren artık Microsoft’un ASP.NET MVC çatısı hakkında konuşacağız işte\r\n bu konuda konuşulacak, söylenecek, uygulanacak çok fazla şey var :) \r\nBaşlayalım.</p>\r\n<p>Geleneksel ASP.NET formlarını kullanıyorsanız ve “neden ASP.NET MVC kullanayım?” diyorsanız okumaya başlayabilirsiniz.</p>\r\n<h3>ASP.NET Formlarının Dezavantajları</h3>\r\n<p><strong>ViewState</strong> : ASP.NET formlarında ViewState güzel ve \r\nsempatik işlevleri olmasına karşın kötü bir tarafı var. Çok şişman. \r\nŞöyle:  Geleneksel ASP.NET sayfalarında form, kullanıcı bilgileri ve \r\ndurumları tutması ve postback anında kaybolmasını View State ile \r\nengelliyorduk. ViewState bu bilgileri base64 formatında şifreleyerek \r\ntutuyor. (<a href="http://www.ahmetcigsar.com/yazilim/aspnet/viewstate-yapisi-ve-viewstate-decoding-viewstate-decode/" target="_blank">ViewState kod oluşturma yapısı</a>)\r\n Bu durum kullanıcı sayfayı ziyaret ettiğinde ve her bir istekte \r\nbulunuşunda onlarca hatta yüzlerce kilobyte’lık  verinin oluşturulması \r\nve HTML çıktısı sayfaya eklenmesi anlamına geliyor ve  sayfayanın \r\nboyutunu artırıyor. Boyutu artan sayfa sunucuya gitmekle kalsa birde \r\nsunucudan tekrar bize geri dönüyor. (Postback) Her defasında hem sunucu \r\ntarafında ciddi bantgenişliği harcarken, kullanıcı tarafında ise \r\nsayfanın açılışı ciddi yavaşlamalara sebep oluyor.</p>\r\n<p><strong>Page Life Cycle (Sayfa Yaşam Döngüsü)</strong> : Bu yapı \r\nkullanıcı tarafı (client-side) ile server tarafı (server-side) arasında \r\nevent’lerin ilişkilerini düzenleyen bir mekanizmadır.  Request-response \r\ndediğimiz yapı yani kullanıcı tarafından gönderilen istek ve sunucu \r\ntarafından bu isteğe  verilen cevap arasındaki ilişkileri düzenleyen bir\r\n yapıdır. Gelin görünki bu yapı oldukça karmaşıktır. Page life cycle’a \r\nmüdahale edebilme şansımız var fakat bunu yaptığımızda kötü sürprizlerle\r\n karşılaşabilme ihtimalimiz oldukça yüksek. Öyle ki bazen ortaya çıkan \r\nhataların neden çıktığını bulamayabilirsiniz.</p>\r\n<p><strong>Serseri HTML Çıktıları :</strong> Sunucu taraflı \r\n(server-side) diller HTML çıktısı verirler bunu bilmeyenimiz yoktur.  \r\nASP.NET sayfalarında sunucuda yorumlandıktan sonra HTML çıktısı olarak \r\nbize gelir. Fakat burada hakimiyetimiz sınırlıdır yani istediğimiz gibi \r\nbir HTML sayfasını çıktı olarak alamayabiliriz, görüntü olarak \r\nistediğimiz HTML dosyasını alsak dahi kod temizliği ve W3 standartlarına\r\n uygun HTML çıktısı almak oldukça zor bir hal alıyor ve ortaya kendi \r\nhalinde, bizim belirlediğimiz disiplinden uzak, serseri HTML sayfaları \r\noluşabilir. Özellikle CSS ve javascript işin içine girince \r\nhayalkırıklığımız artabiliyor. ASP.NET 4.x sürümü ile bu sorun bir nebze\r\n çözülmüş olsada tamamen ortadan kalktığı söylenemez.</p>\r\n<p><strong>Aşırı Code-Behind Bağımlılığı</strong> : Katmansal bir \r\nmimariyle (N-Tier vb.) web uygulaması geliştireceksiniz diyelim. Sunum \r\nve iş katmanlarını ayırdınız iyi güzelde ASP.NET formları aslında bu \r\nyapıya oldukça ters. Sebebi bir çok mantıksal işlemleri yapacak kodları \r\nsunum katmanındaki sayfaların code-behind tarafında yazmak zorunda \r\nkalmamız. Hani katmansal mimarimiz? Ayrıca bu durum projenin daha sonra \r\ngüncellemek veya eklentiler yapmak için ele alındığında işleri daha da \r\nzorlaştıracaktır çünkü dağınık bir kod yapısı bizi beklemektedir.</p>\r\n<h2>ASP.NET MVC Framework ile Tanışalım</h2>\r\n<p>Malum MVC 1979 yılından bu yana bilinen bir yazılım mimari deseni ve \r\nbir çok programlama dilinde kullanılan bir desen(kalıp).  ASP.NET MVC \r\nFramework’de Microsoft tarafından geliştirilmiş ve halen geliştirilen  \r\nASP.NET ile MVC mimarisini kullanmamıza olanak sağlayan bir MVC \r\nçatısıdır.</p>\r\n<p><strong>ASP.NET MVC’de Model-View-Controller yapıları ve görevleri.</strong></p>\r\n<p><strong>Model</strong> : Veritabanına erişim, class’lar, ayrıca data \r\naccess layer yani veritabanı işlemleri için kullanacağımız Ado.Net, \r\nNhibernate veya EntityFramework ile veri işlemleri burada yer alır.</p>\r\n<p><strong>View</strong> : Kullanıcının gördüğü ve arayüze dair şeyler \r\nburadadır. HTML, CSS, Javascript kodları… View bölümünde iş akışına ait \r\nbir şeyler bulunmaz. Ayrıca View bölümü sayesinde uygulamanın arayüzü \r\nuygulamanın çekirdek kısmından ayrı tutulduğundan tasarımı ve tasarımın \r\ndeğiştirilmesi açısından bize avantaj sağlar.</p>\r\n<p><strong>Controller</strong> : Client (kullanıcı) tarafından yapılan \r\nrequest (istek) controller’lar tarafından yakalanır ve işleme tabi \r\ntutulur. Bu bölüm iş akışının gerçekleştiği, arayüzden gelen kullanıcı \r\netkileşimlerinin değerlendirildiği, işlendiği, gerekli metodların \r\nçalıştırıldığı, değişkenlerin ve nesnelerin  oluşturulduğu, model ile \r\nview bölümleri arasında iletişimin sağlandığı yerdir. ASP.NET MVC’de \r\ncontroller dediğimiz nesneler aslında <strong><span style="color: #3366ff;">System.Web.Mvc.Controller</span></strong> ‘dan miras almış minik C# class’larıdır.<br>\r\nŞunu unutmayalım: <strong>Her View için bir Controller vardır fakat her Controller için View şartı yoktur.</strong></p>', 'Turgay Günel'),
(7, 'C# ref ve out Parametreleri', '<p style="margin: 0px 0px 15px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);">Merhaba, bu yazımda parametreleri daha etkin kullanmak için pratik yollardan olan<span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">ref</strong><span class="Apple-converted-space">&nbsp;</span>ve<span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">out</strong>parametrelerden bahsedeceğim.</p><h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 34px; font-style: normal; font-variant: normal; font-weight: 900; font-stretch: inherit; line-height: 32px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);">ref</h2><p style="margin: 0px 0px 15px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);">Normal bir kullanımda parametrelerde yaptığımız değişiklikler argümanları etkilemiyor.</p><p style="margin: 0px 0px 15px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">Kare()</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"><span class="Apple-converted-space">&nbsp;</span>metoduna “</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">a”</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"><span class="Apple-converted-space">&nbsp;</span>argümanını gönderip aktardığı değerle işlem yaptırdık. Ve daha sonra “</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">a</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">” değişkenini ekrana yazdırdık. Ancak metodu çağırdıktan sonrada öncede sonuç değişmedi. Çünkü biz “</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">a</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">” argümanının yalnızca değerini gönderdik. Ama referansını aktarmadık. Bu yüzden yaptığımız işlem yalnızca “</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">i</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">”&nbsp;parametresini ilgilendiriyor. Eğer argümanın gönderdiğimiz metotta kendi referansı ile işlem görmesini istiyorsak imdadımıza<span class="Apple-converted-space">&nbsp;</span></span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ref</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"><span class="Apple-converted-space">&nbsp;</span>anahtar sözcüğü&nbsp;yetişiyor. Aynı işlemi<span class="Apple-converted-space">&nbsp;</span></span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ref</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"><span class="Apple-converted-space">&nbsp;</span>olmadan da yapabiliriz fakat işler daha karmaşık hale geldiğinde zorluk yaşamamak için<span class="Apple-converted-space">&nbsp;</span></span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ref</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);">kullanımını daha mantılı olacaktır.<span class="Apple-converted-space">&nbsp;</span></span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ref</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"><span class="Apple-converted-space">&nbsp;</span>parametresi kullanımında önemli bir nokta var.<span class="Apple-converted-space">&nbsp;</span></span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ref</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"><span class="Apple-converted-space">&nbsp;</span>olarak aktarılacak bir argümana çağrıdan önce değer atanmalıdır. ref kullanarak bir argümana ilk değer atanması mümkün değildir. Şimdi yukarıdaki işlemin biraz daha karmaşığını<span class="Apple-converted-space">&nbsp;</span></span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ref</strong><span style="color: rgb(48, 48, 48); font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 28px; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);"><span class="Apple-converted-space">&nbsp;</span>ile yapalım.</span></p><p style="margin: 0px 0px 15px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);"><br></p><h2 style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 34px; font-style: normal; font-variant: normal; font-weight: 900; font-stretch: inherit; line-height: 32px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);">out</h2><p style="margin: 0px 0px 15px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">out</strong><span class="Apple-converted-space">&nbsp;</span>anahtar sözcüğü iki veya daha fazla geriye döndürmek istediğimizde kullandığımız bir anahtar sözcüktür.<span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">ref</strong><span class="Apple-converted-space">&nbsp;</span>parametresi de aynı işlemi gerçekleştirebilir. Ancak iki önemli nokta var;</p><p style="margin: 0px 0px 15px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">a)</strong><span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">out</strong><span class="Apple-converted-space">&nbsp;</span>parametresi ilk değer atamasına gerek duymaz. Bu iyi bir özellik, yani sadece geriye değer döndürmek için kullanılır.</p><p style="margin: 0px 0px 15px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">b)</strong><span class="Apple-converted-space">&nbsp;</span>Metot sonlanmadan<span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">out</strong><span class="Apple-converted-space">&nbsp;</span>parametresine değer atamak zorundayız, çünkü ilk değer vermediğimiz için herhangi bir değere sahip değil.</p><p style="margin: 0px 0px 15px; padding: 0px; border: 0px; font-family: Ubuntu, sans-serif, serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: inherit; line-height: 28px; vertical-align: baseline; color: rgb(48, 48, 48); letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify; background-color: rgb(255, 255, 255);">Sonuç olarak birden fazla değer döndürme ihtiyacı duyduğumuz zaman<span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">out</strong><span class="Apple-converted-space">&nbsp;</span>parametresi işimize yarayacaktır. Örnek olarak bir<span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline;">out</strong><span class="Apple-converted-space">&nbsp;</span>parametresi kullanımına bakalım.</p>', 'İlkay Günel');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Tablo için indeksler `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `uyeler`
--
ALTER TABLE `uyeler`
  ADD PRIMARY KEY (`kullaniciAdi`);

--
-- Tablo için indeksler `yazilar`
--
ALTER TABLE `yazilar`
  ADD PRIMARY KEY (`yaziId`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `userroles`
--
ALTER TABLE `userroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tablo için AUTO_INCREMENT değeri `yazilar`
--
ALTER TABLE `yazilar`
  MODIFY `yaziId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;