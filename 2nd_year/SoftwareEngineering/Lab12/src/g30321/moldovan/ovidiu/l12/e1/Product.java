package g30321.moldovan.ovidiu.l12.e1;

public class Product {
    String name;
    int quantity;
    float price;

    public Product(String name, int quantity, int price) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    public Product(String name) {
        this(name, 1,1);
    }
    public String toString() {
        return "( "+ name + " " + quantity + "@" + price+ ")";
    }
}
