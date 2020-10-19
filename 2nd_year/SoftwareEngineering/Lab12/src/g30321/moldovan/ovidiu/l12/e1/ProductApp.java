package g30321.moldovan.ovidiu.l12.e1;

import java.awt.FlowLayout;

import javax.swing.JFrame;
import javax.swing.WindowConstants;

public class ProductApp extends JFrame {

    UserView userView;
    ProductStore productStore;
    Controller controller;

    public ProductApp() {
        setTitle("Product App");
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        userView = new UserView();
        setLayout(new FlowLayout());
        add(userView);
        setSize(300, 400);
        pack();
        setVisible(true);

        productStore = new ProductStore(userView);
        productStore.add(new Product("Apple"));
        productStore.add(new Product("Orange"));

        controller = new Controller(productStore, userView);
    }

    public static void main(String[] args) {
        ProductApp app = new ProductApp();
    }

}
