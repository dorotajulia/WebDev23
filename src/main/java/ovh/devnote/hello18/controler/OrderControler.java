package ovh.devnote.hello18.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ovh.devnote.hello18.entity.Produkt;
import ovh.devnote.hello18.entity.Zamowienie;
import ovh.devnote.hello18.services.ProductService;
import ovh.devnote.hello18.services.OrderService;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderControler {
    @Autowired
    OrderService orderService;
    @Autowired
    ProductService productService;

    @GetMapping("/createOrder")
    public String createOrder(@ModelAttribute("products")String products, @ModelAttribute("username") String username,@ModelAttribute("price") float price) {
        Zamowienie zamowienie = new Zamowienie();
        String[] split = products.split(";");
        String productsString = "";
        for (int i = 0; i<split.length; i++){

            if(!split[i].substring(0, split[i].length()).isEmpty()) {
                int j = Integer.parseInt(split[i].substring(0, split[i].length()));
                zamowienie.addProdukt(productService.getProduktByID(j));
                Produkt product = productService.getProduktByID(j);
                productsString = productsString + product.getNazwa() + ", ";
                System.out.println(j);
            }

        }

        zamowienie.setUsername(username);
        zamowienie.setProductsString(productsString);
        zamowienie.setDate_time(Timestamp.from(Instant.now()));
        zamowienie.setPrice(price);
        zamowienie.setStatus("ZLOZONE");

        orderService.saveOrder(zamowienie);
        return "redirect:/cart/empty";
    }

    @RequestMapping("/userOrderList")
    public String userOrderList(Model model){
        List<Zamowienie> orders = orderService.getOrders(SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("orders",orders);
        return "userZamowienia";
    }

    @RequestMapping("/adminOrderList")
    public String adminOrderList(Model model){
        List<Zamowienie> orders = orderService.getOrders();
        model.addAttribute("orders",orders);
        System.out.println(orders.get(0).getProductsString());

        return "adminZamowienia";
    }

    @PostMapping("/complete")
    public String completeOrder(@RequestParam(name = "orderId") int id){
        orderService.completeOrder(id);
        return "redirect:/orders/adminOrderList";
    }

}
