# Valorant Wiki
![Valorant](https://wdgbdjqczgdpodxvxfwj.supabase.in/storage/v1/object/sign/valorant/readmePhotos/valorant_readme.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ2YWxvcmFudC9yZWFkbWVQaG90b3MvdmFsb3JhbnRfcmVhZG1lLmpwZyIsImlhdCI6MTYzMjU2NTA0OCwiZXhwIjoxOTQ3OTI1MDQ4fQ.WPgPTqn5bpxN-zuBumtlwrTWMWy3pJCc1_gUHp5InWk)


Yeni Flutter projem çok fazla zaman geçidiğim bir oyun olan **Valorant**'a ait Wiki. Oyun hakkında bilgilendirici içerikler,haberler bulunan projem gelişmeye açık ve geliştirmeye devam edeceğim.

## Proje Hakkinda
Uygulama da kullanığım verileri Firebase alternatifi olan [Supabase](https://supabase.io/)'i kullandım. Supabase sql veritabanı kullanıyor. Flutter ile kulanımı gayet kolay ve sitesinde akıcı bir şekilde anlatılmıştır.

## Paketler
Onboard Screen tasarımı için [Introduction Screen](https://pub.dev/packages/introduction_screen) paketini kulandım.

Karakter sayfasında slider card tasarımı için [Carousel Slider](https://pub.dev/packages/carousel_slider) paketini kullandım.

![Carousel Slider Örngi](https://wdgbdjqczgdpodxvxfwj.supabase.in/storage/v1/object/sign/valorant/readmePhotos/carousel_Slider.gif?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ2YWxvcmFudC9yZWFkbWVQaG90b3MvY2Fyb3VzZWxfU2xpZGVyLmdpZiIsImlhdCI6MTYzMjU2NDk5MiwiZXhwIjoxOTQ3OTI0OTkyfQ.iocP8sobn2calIMHDlNzFfDDn9MPvWQC_6n1oIryF_I)

Supabase ile bağlantı kurmak için [Supabase](https://pub.dev/packages/supabase) paketini kullandım.

Uygulamada kullandığım fotografları Supabase store'a aktardım.Bunları Çekmek için [Octo image](https://pub.dev/packages/octo_image) paketini kullandım.

Fotografları önbelleğe yükleyip kullanabilmek için [Cached Network Images](https://pub.dev/packages/cached_network_image) paketini kullandım.

Önbellekte fotograflar hakkında bilgi için [Flutter](https://flutter.dev/docs/cookbook/images/cached-images) sitesini ziyaret edebilirsiniz.

Fotograflar internet üzerinden alındığı için gecikmeler oluyor ve bunun daha hoş görünmesi için blurhash kullandım. Bu teknoloji aslında fotografınızı blurlayıp size bir string değer veriyor ve placeholder olarak kullanılabiliyor. Bunun için [Blurhash](https://blurha.sh/) sayfasını kullandım.

![Blurhash Örnegi](https://wdgbdjqczgdpodxvxfwj.supabase.in/storage/v1/object/sign/valorant/readmePhotos/readme_burhash.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ2YWxvcmFudC9yZWFkbWVQaG90b3MvcmVhZG1lX2J1cmhhc2guanBnIiwiaWF0IjoxNjMyNTY0NzY2LCJleHAiOjE5NDc5MjQ3NjZ9.rin-YxAOCBDArz-0B7xjFfhwI9Vsg5BDwPMvYDEIJ7I)



Uygulamanın apk çıktısını alıp kullanabilmek için bazı izinler gerekiyor.Gerekli olacak tüm [Android İzinilerini](https://medium.com/gokhanyavas/android-permission-android-izinleri-903c4dd7c43) buradan bakabilirsiniz. Bu izinleri yazacağınız yer ise Flutter özelinde Android/app/src/main/AndroidMainfest.xml dosyasıdır. İzinler application tagının üzerinde manifest xmlns:android dizininin içerisinde olmalıdır. 

![Manifest Örnegi](https://wdgbdjqczgdpodxvxfwj.supabase.in/storage/v1/object/sign/valorant/readmePhotos/readme_manifest.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ2YWxvcmFudC9yZWFkbWVQaG90b3MvcmVhZG1lX21hbmlmZXN0LnBuZyIsImlhdCI6MTYzMjU2NTAzNywiZXhwIjoxOTQ3OTI1MDM3fQ.FxRlwG39eqEt6HBB1igYhqa2KNf0CA9Kk8ubkZQGvJw)

Uygulamaya Icon eklemek için [Flutter Launcher Icon](https://pub.dev/packages/flutter_launcher_icons) paketini kullandım.







## Font 
Projede [Comforta](https://www.dafont.com/comfortaa.font) fontunu kullandım.

## Eklenecek Geliştirmeler
1-Yeni öğrenmeye başladığım state management konusunu projeye dahil etmeyi düşünüyorum.

2-Riot Games API'ı ile bağlantı kurup hesap girişi yapılacak.

3-E-spor maçlarının sonuçarı ve maçlarla ilgili bilgilerin bulunacağı bir bölüm eklenecek.

4-Skillerin kullanım videosu eklenecek.

5-Haber Sayfası eklenecek.

## İndirme Linki

  [Valorant Wiki](https://dosya.co/k63k089x43cs/valorant_Wiki.apk.html)



