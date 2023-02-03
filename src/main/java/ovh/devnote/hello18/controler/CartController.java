package ovh.devnote.hello18.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ovh.devnote.hello18.Cart;
import ovh.devnote.hello18.entity.Produkt;
import ovh.devnote.hello18.services.ProductService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    private final Cart cart = new Cart();
    @Autowired
    private ProductService productService;

    @GetMapping
    public String cart(Model model) {
        List<Produkt> products = new ArrayList<>();
        for (Integer id : cart.productIds) {
            int i = id;
            products.add(productService.getProduktByID(i));
        }
        model.addAttribute("products", products);
        return "cart";
    }

    @PostMapping("/createOrder")
    public String createOrder(Model model,Model username,Model priceModel,@RequestParam(name = "total") float price) {
        List<Produkt> products = new ArrayList<>();
        String productsString = "";
        for (Integer id : cart.productIds) {
            productsString = productsString + id.toString() +";";
            int i = id;
            products.add(productService.getProduktByID(i));
        }

        String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();

        username.addAttribute("username", currentUserName);
        model.addAttribute("products", productsString);
        priceModel.addAttribute("price", price);

        return "redirect:/orders/createOrder";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam(name = "productId") int id) {
        if (id != 0){
            cart.addProduktId(id);
        }

        return "redirect:/cart";
    }

    @PostMapping("/delete")
    public String deleteFromCart(@RequestParam(name = "bookId") int id) {
        if (id != 0){
            cart.deleteBookId(id);
        }

        return "redirect:/cart";
    }

    @GetMapping("/empty")
    public String emptyCart() {
        cart.productIds.clear();

        return "redirect:/cart";
    }

}
