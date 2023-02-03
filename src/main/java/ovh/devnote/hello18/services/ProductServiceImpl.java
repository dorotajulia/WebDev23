package ovh.devnote.hello18.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ovh.devnote.hello18.dao.ProductDAO;
import ovh.devnote.hello18.entity.Kategoria;
import ovh.devnote.hello18.entity.Produkt;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDAO productDAO;

    @Override
    @Transactional
    public List<Produkt> getProdukty() {
        List<Produkt> produkts = productDAO.getProdukty();
        return produkts;
    }
    @Override
    @Transactional
    public void saveProdukt(Produkt produkt) {
        productDAO.saveProduct(produkt);
    }

    @Override
    @Transactional
    public void deleteProdukt(int productID){
        if (productID != 0) {
            productDAO.deleteProduct(productID);
        }
    }

    @Override
    @Transactional
    public void updateProdukt(int produktID, Produkt produkt){
        if (produktID != 0) {
            productDAO.updateProduct(produktID, produkt);
        }
    }

    @Override
    @Transactional
    public Produkt getProduktByID(int produktID){
        Produkt produktNew = new Produkt();
        if (produktID != 0) {
            produktNew = productDAO.getProductByID(produktID);
        }
        return produktNew;
    }

    @Override
    @Transactional
    public List<Kategoria> getKategoria(){ return productDAO.getKategoria(); }

    @Override
    @Transactional
    public Kategoria getKategoriaByID(int id){ return productDAO.getKategoriaByID(id);}
}
