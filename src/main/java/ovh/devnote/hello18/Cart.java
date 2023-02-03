package ovh.devnote.hello18;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import java.util.HashSet;
import java.util.Set;

@Component
@SessionScope
public class Cart {
    public Set<Integer> productIds = new HashSet<>();
    public void addProduktId(int id) {
        Integer i = id;
        productIds.add(i);
    }
    public void deleteBookId(Integer id) {
        Integer i = id;
        System.out.println(id);
        productIds.remove(i);
    }
    public Set<Integer> getProductIds() {
        return productIds;
    }
}
