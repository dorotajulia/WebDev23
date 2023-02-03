package ovh.devnote.hello18.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="marki")
public class Marka {
    public Marka() {
    }
    public Marka(String nazwa) {
        this.nazwa = nazwa;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    @Column(name="nazwa")
    private String nazwa;
    @ManyToMany
    @JoinTable(
            name="marki_to_produkty",
            joinColumns = @JoinColumn(name="marka_id"),
            inverseJoinColumns = @JoinColumn(name="produkt_id")
    )
    private Set<Produkt> produkt;
    public void addKsiazka(Produkt ksiazka) {
        if (produkt == null) {
            produkt = new HashSet<>();
        }
        //ksiazka.addAutor(this);
        produkt.add(ksiazka);
    }
    public void removeKsiazka(Produkt ksiazka){
        if (produkt == null)
            return;
        //autor.addProdukt(this);
        produkt.remove(ksiazka);
    }
    public String getNazwa() {
        return nazwa;
    }
    public void setNazwa(String imie) {
        this.nazwa = nazwa;
    }
    public Set<Produkt> getProdukt() {
        return produkt;
    }
    public void setProdukt(Set<Produkt> ksiazki) {
        this.produkt = ksiazki;
    }
    @Override
    public String toString() {
        return "Marka{" +
                "id=" + id +
                ", nazwa='" + nazwa + '\'' +
                '}';
    }
}

