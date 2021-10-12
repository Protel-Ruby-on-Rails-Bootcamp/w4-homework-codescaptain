#Todo 
 + Comment `Model` eklenecek (title:string, content:text, user_id:integer, post_id:integer, accepted:boolean) +>      content ve title zorunlu alan olacak

  + Comment controller index methodu ile oluşturucam
  + Index de post un commentleri gözükücek click here to accept it linkine tıklanınca commnet show açılacak
  + Burada approve butonu olacak ve comment i approve edebilecek

 + User profil olacak diğer kullanıcılar sadece login iken burayı görebilecek 
  + User controller oluşturulacak
  + username , email gözükecek
  + Bu user ın postları listelenecek
  + Show post olacak ve tıkladığında yorum yapabilecek
  



+ Comments
    + Ender wrote a comment to your X article. Click here to accept it. (click yapilinca yeni sayfa)
    + Yeni sayfa
        + X article comment
            + Title
            + Content
            + Approve button 
                Approve button tiklayinca comment gorunebilir oluyor
+ Welcome page
    + public article'lar gorunecek ve onlarin title/authorlari
+ User profil (sadece login olanlar gorebilecek) mywebsite.com/users/15
    + User name
    + email
    + Articles (public)
        + Title created at (tiklayinca content'e de gidicek) burada comment de yapilabilecek comment'ler de gorulecek
+ User dashboard
    + Kendi articlarimiz CRUD
    + Comment listesi ve approve'lama

#Core Todo

+ Comment sadece login olan kullanıcılar yapabilecek
+ Post index sayfasında hala edit destroy çıkıyor bunlar kalkacak
   