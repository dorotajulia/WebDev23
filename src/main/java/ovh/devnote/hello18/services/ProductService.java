package ovh.devnote.hello18.services;

import ovh.devnote.hello18.entity.Kategoria;
import ovh.devnote.hello18.entity.Produkt;

import java.util.List;

public interface ProductService {
    List<Produkt> getProdukty();
    public void saveProdukt(Produkt produkt);
    public void deleteProdukt(int produktID);
    public void updateProdukt(int produktID, Produkt produkt);
    public Produkt getProduktByID(int produktID);

    public List<Kategoria> getKategoria();
    public Kategoria getKategoriaByID(int id);
}

