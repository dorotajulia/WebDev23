package ovh.devnote.hello18.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="kategorie_shop")
public class Kategoria {
    public Kategoria() {
    }
    public Kategoria(String nazwa) {
        this.nazwa = nazwa;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    @Column(name="nazwa")
    private String nazwa;
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "kategoria",cascade = CascadeType.ALL)
    List<Produkt> produkty;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNazwa() {
        return nazwa;
    }
    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }
    public List<Produkt> getProdukty() {
        return produkty;
    }
    public void setProdukty(List<Produkt> ksiazki) {
        this.produkty = ksiazki;
    }
    public void addKsiazka(Produkt ksiazka){
        if (produkty.isEmpty())
            produkty = new ArrayList<>();
        ksiazka.setKategoria(this);
        produkty.add(ksiazka);
    }
    @Override
    public String toString() {
        return "Kategoria{" +
                "id=" + id +
                ", nazwa='" + nazwa + '\'' +
                '}';
    }
}
