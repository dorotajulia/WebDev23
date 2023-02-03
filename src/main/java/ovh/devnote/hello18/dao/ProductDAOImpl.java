package ovh.devnote.hello18.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ovh.devnote.hello18.entity.Kategoria;
import ovh.devnote.hello18.entity.Produkt;

import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {
    @Autowired
    private SessionFactory mySessionFactory;

    @Override
    public List<Produkt> getProdukty() {
        Session currentSession = mySessionFactory.getCurrentSession();
        Query<Produkt> query = currentSession.createQuery(" from Produkt", Produkt.class);
        return query.getResultList();
    }


    @Override
    public void saveProduct(Produkt produkt) {
        Kategoria kategoria = new Kategoria();
        kategoria.setNazwa("Other");
        kategoria.setId(5);
        produkt.setKategoria(kategoria);
        Session session = mySessionFactory.getCurrentSession();
        session.save(produkt);
    }

    @Override
    public void updateProduct(int produktID, Produkt produkt) {
        Session session = mySessionFactory.getCurrentSession();
        Produkt produktToUpdate = session.get(Produkt.class, produktID);
        produktToUpdate.setNazwa(produkt.getNazwa());
        produktToUpdate.setOpis(produkt.getOpis());
        produktToUpdate.setCena(produkt.getCena());

    }

    @Override
    public void deleteProduct(int produktID){
        Session session = mySessionFactory.getCurrentSession();
        Produkt produktToDelete = session.get(Produkt.class, produktID);

        session.delete(produktToDelete);
    }

    @Override
    public Produkt getProductByID(int produktID){
        Session session = mySessionFactory.getCurrentSession();
        Produkt produkt = session.get(Produkt.class, produktID);

        return produkt;
    }

    @Override
    public List<Kategoria> getKategoria(){

        Session currentSession = mySessionFactory.getCurrentSession();

        Query<Kategoria> query = currentSession.createQuery(" from Kategoria", Kategoria.class);
        List<Kategoria> kategoriaList = query.getResultList();
        return kategoriaList;
    }

    @Override
    public Kategoria getKategoriaByID(int id){
        Session currentSession = mySessionFactory.getCurrentSession();

        Query<Kategoria> query = currentSession.createQuery("SELECT b from Kategoria b WHERE b.id LIKE ?1", Kategoria.class).setParameter(1,id);
        Kategoria kategoria = query.getSingleResult();
        return kategoria;
    }


}