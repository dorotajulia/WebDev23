package ovh.devnote.hello18.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ovh.devnote.hello18.entity.Kategoria;
import ovh.devnote.hello18.entity.Produkt;
import ovh.devnote.hello18.services.ProductService;

import java.util.List;

@Controller
@RequestMapping("/shop")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/list")
    public String listProdukt(Model model){
        List<Produkt> produkty = productService.getProdukty();
        model.addAttribute("produkty",produkty);
        return "productlist";
    }

    @GetMapping("/all")
    public String listProduktAll(Model model){
        List<Produkt> produkty = productService.getProdukty();
        model.addAttribute("produkty",produkty);
        return "productlistAll";
    }



    @GetMapping("/deleteForm")
    public String deleteForm(Model model, Model modelIDToDelete){
        List<Produkt> produkty = productService.getProdukty();
        int productIDToDelete = 0;
        model.addAttribute("products",produkty);
        modelIDToDelete.addAttribute("productToDelete",productIDToDelete);
        return "deleteProdukt";
    }

    @PostMapping("/deleteProduct")
    public String deleteProdukt(@ModelAttribute("productToDelete") int ksiazkaID){
        productService.deleteProdukt(ksiazkaID);
        return "redirect:/shop/manage";
    }

    @GetMapping("/formadd")
    public String addForm(Model model) {
        List<Kategoria> kategoriaList = productService.getKategoria();
        Produkt product = new Produkt();
        Kategoria kategoria = new Kategoria();
        kategoria.setNazwa("Other");
        kategoria.setId(5);
        product.setKategoria(kategoria);
        model.addAttribute("product",product);

        return "addProductform";
    }

    @PostMapping("/saveProduct")
    public String saveProdukt(@ModelAttribute("product") Produkt ksiazka){
        productService.saveProdukt(ksiazka);
        return "redirect:/shop/all";
    }

    @RequestMapping("/chooseProductToUpdate")
    public String chooseForm(Model model, Model productToUpDateIDModel){
        List<Produkt> products = productService.getProdukty();
        int productIDToUpdate = 0;
        model.addAttribute("products",products);
        productToUpDateIDModel.addAttribute("productToUpDateID",productIDToUpdate);
        return "updateChooseProduct";
    }

    @RequestMapping("/updateForm")
    public String updateForm(@ModelAttribute("productToUpDateID") int productID,Model model, Model newProduktModel){
        Produkt produkt = productService.getProduktByID(productID);
        Produkt newProdukt = new Produkt();
        model.addAttribute("product",produkt);
        newProduktModel.addAttribute("productToUpDate", newProdukt);

        return "updateProductForm";
    }

    @PostMapping("/updateProduct/{subjectid}")
    public String updateProduct(@ModelAttribute("productToUpDate") Produkt product, @PathVariable int subjectid){
        productService.updateProdukt(subjectid, product);
        return "redirect:/shop/manage";
    }

}

