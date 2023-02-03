package ovh.devnote.hello18.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "shop_orders")
public class Zamowienie {

    public Zamowienie(){}
//    public Orders(String nazwa, String wydawnictwo, float cena) {
//        this.nazwa = nazwa;
//        this.wydawnictwo = wydawnictwo;
//        this.cena = cena;
//    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    @Column(name = "price")
    private float price;
    @Column(name = "status")
    private String status;
    @Column(name = "date_time")
    private Timestamp date_time;
    @Column(name = "username")
    private String username;
    @Column(name = "productsString")
    public String productsString;

    @ManyToMany
    @JoinTable(
            name="zamowienia_to_produkty",
            joinColumns = @JoinColumn(name="order_id"),
            inverseJoinColumns = @JoinColumn(name="produkt_id")
    )
    private List<Produkt> produkty;

    public void updateProduktString(){
        String products = "";
        for (Produkt produkt : produkty) {
            products = products + produkt.getNazwa() +", ";
        }
        productsString = products;
    }
    public void addProdukt(Produkt produkt){
        if (produkty == null)
            produkty = new ArrayList<>();

        produkty.add(produkt);
        updateProduktString();
    }

    public void removeProdukt(Produkt ksiazka){
        if (produkty == null)
            return;

        produkty.remove(ksiazka);
        updateProduktString();
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getDate_time() {
        return date_time;
    }

    public void setDate_time(Timestamp date_time) {
        this.date_time = date_time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setProdukty(List<Produkt> produkty) {
        this.produkty = produkty;
    }

    public List<Produkt> getProdukty() {
        return produkty;
    }

    public void setProductsString(String produktyString) {
        this.productsString = produktyString;
    }

    public String getProductsString(){
        return productsString;
    }

//    public String getKsiazkiString(){
//        String books = "";
//        for (Ksiazka book : ksiazki) {
//            books = books + book.getNazwa() +", ";
//        }
//        return books;
//    }
}
