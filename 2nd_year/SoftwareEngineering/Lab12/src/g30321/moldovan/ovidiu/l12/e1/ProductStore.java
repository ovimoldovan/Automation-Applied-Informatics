package g30321.moldovan.ovidiu.l12.e1;

import java.util.ArrayList;
import java.util.Observable;

public class ProductStore extends Observable {
    public ArrayList<Product> products;
    public ProductStore(UserView userView) {
        products = new ArrayList<>();
        this.addObserver(userView);
    }

    public void add(Product product) {
        System.out.println("ADD " + product);
        products.add(product);
        this.setChanged();
        this.notifyObservers();
    }
    public void remove(int index) {
        System.out.println("REMOVE v:"+index+" m:" + products.get(index));
        products.remove(index);
        this.setChanged();
        this.notifyObservers();
    }

    public void changeQuantity(int index, int quantity) {
        System.out.println("CHANGE v:"+index+" m:" + products.get(index) + "to Q: " + quantity);
        Product intermeidar = products.get(index);
        intermeidar.quantity = quantity;
        products.set(index,intermeidar);
        this.setChanged();
        this.notifyObservers();
    }
    public int getSize() {
        return products.size();
    }
}
