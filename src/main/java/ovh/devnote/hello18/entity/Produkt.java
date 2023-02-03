package ovh.devnote.hello18.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

@Entity
@Table(name="produkty")
public class Produkt {
    public Produkt(){}
    public Produkt(int id,String nazwa, String opis, float cena) {
        this.id = id;
        this.nazwa = nazwa;
        this.opis = opis;
        this.cena = cena;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    @Column(name="nazwa")
    private String nazwa;
    @Column(name="opis")
    private String opis;
    @Column(name="cena")
    private float cena;
    @ManyToOne(cascade =
            {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name="kategoria_id")
    private Kategoria kategoria;
    @ManyToMany
    @JoinTable(
            name="marki_to_produkty",
            joinColumns = @JoinColumn(name="produkt_id"),
            inverseJoinColumns = @JoinColumn(name="marka_id")
    )
    private Set<Marka> marki;
    public void addMarka(Marka marka){
        if (marki == null)
            marki = new HashSet<>();
        //autor.addProdukt(this);
        marki.add(marka);
    }

    public void removeMarka(Marka marka){
        if (marki == null)
            return;
        marki.remove(marka);
    }

    public String getNazwa() {
        return nazwa;
    }
    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }
    public String getOpis() {
        return opis;
    }
    public void setOpis(String opis) {
        this.opis = opis;
    }
    public float getCena() {
        return cena;
    }
    public void setCena(float cena) {
        this.cena = cena;
    }
    public Kategoria getKategoria() {
        return kategoria;
    }
    public void setKategoria(Kategoria kategoria) {
        this.kategoria = kategoria;
    }
    public Set<Marka> getMarki() {
        return marki;
    }
    public void setMarki(Set<Marka> marki) {
        this.marki = marki;
    }
    public int getId(){ return id;}
    public String getMarkaString(){
        Iterator<Marka> autorzyIterator = marki.iterator();
        String markiString = "";
        while(autorzyIterator.hasNext()) {
            Marka temp = autorzyIterator.next();
            markiString = markiString + temp.getNazwa() +  ", ";
        }
        return markiString;
    }
    @Override
    public String toString() {
        return "Ksiazka{" +
                "id=" + id +
                ", nazwa='" + nazwa + '\'' +
                ", opis='" + opis + '\'' +
                ", cena=" + cena +
                ", kategoria=" + kategoria +
                '}';
    }
}
