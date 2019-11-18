(*
        Happy Halloween
        ===============
        ManuscriptManagerin testi
        Käsikirjoitus
        18.11.2019 (c) antero Kangas
*)
(Settings 
    (defaultLanguage fi)
    (output HappyHalloween.mp3)
)
(Role Kertoja (pitch 0.75) (rate 0.7) (gain 7))
(Role Yksinainen_tytto (pitch 1.1) (rate 1.5))
(Role Zombi (pitch 0.75) (rate 0.7))
(Role Dracula (pitch 0.8) (rate 0.8))
(Role Ihmissusi (pitch 1.0) (rate 1.3))
(Role Frankensteinin_hirvio (pitch 1.15) (rate 1.2))
(Group Hirviot (members Zombi Dracula Ihmissusi Frankensteinin_hirvio))

(# Tauot #)
(Wait tauko)
(Wait -- 300)
(Wait --- 1000)
(# Vakioääniefektit #)
(Sound Pam Laukaus.mp3)
(Sound Kirkonkellot Kirkonkellot.mp3 (block False))
(Sound Kirkaisu1 Kirkaisu1.mp3)
(Sound Kirkaisu2 Kirkaisu2.mp3)
(Sound Kirkaisu3 Kirkaisu3.mp3)

(Kertoja Oli synkkä ja myrskyinen yö.)
(Play (duration1 5000) Tuuli ulvoo.mp3)
(Play (start1 5000) (duration1 5000) (block False) Tuuli ulvoo.mp3)
(Play (duration1 5000) Sade.mp3)
(Play (start1 5000) (duration1 5000) (gain -1) (block False) Sade.mp3)
(Kertoja Hän oli aivan yksin talossa.)
(Play tik.mp3)
(---)
(Play tik.mp3)
(---)
(Play tik.mp3)
(---)
(Play tik.mp3)
(---)

(Kertoja Oli suden hetki.)
(Play Susi ulvoo.mp3)
(Play (duration1 2000) Kello lyö 4 kertaa.mp3)

(Kertoja Jostain kuului raskaita askelia.)
(Play Raskaat askeleet.mp3)
(Kertoja Joku lähestyy.)
(Play Nariseva ovi.m
p3)
(Yksinainen_tytto (gain 7) Kuka siellä?)
(Play Ovi sulkeutuu.mp3)
(tauko)

(Yksinainen_tytto (gain 3) (speed 1.7) Mitä sinä teet täällä?)
(Play (duration1 5000) Veitsen teroitus.mp3)
(Yksinainen_tytto Et kai sinä vaan aio?)
(Kertoja Veitsi välähti.)
(Play Veitsen heitto.mp3)

(Kertoja Kurkku katkesi.)
(Play Lima läiskähtää.mp3)
(Kertoja Joku kirkaisi!)
(kirkaisu1 (block True))
(-- 200)
(Play Kauhistunut huuto.mp3)

(###### Huikea loppuratkaisu! #####)
(Kertoja Ja voileipä oli valmis.)
(--)
(# Epilogi #)

(Hirviot (gain 7) Hyvää yötä.)
(Play (duration1 5000) Hyeenan naurua.mp3)
(--)
(Kertoja (language en) Happy Halloween!)
(--)