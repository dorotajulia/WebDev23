package ovh.devnote.hello18.dao;

import ovh.devnote.hello18.entity.Kategoria;
import ovh.devnote.hello18.entity.Produkt;

import java.util.List;


public interface ProductDAO {
    public List<Produkt> getProdukty();
    public void saveProduct(Produkt produkt);
    public void updateProduct(int produktID, Produkt produkt);
    public void deleteProduct(int produktID);
    public Produkt getProductByID(int produktID);

    public List<Kategoria> getKategoria();
    public Kategoria getKategoriaByID(int id);


}
