package g30321.moldovan.ovidiu.l12.e1;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class Controller implements ActionListener{
    UserView userView;
    ProductStore productStore;
    public Controller(ProductStore productStore, UserView userView) {
        this.productStore = productStore;
        this.userView = userView;
        productStore.addObserver(userView);
        userView.setActionListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String source = ((JButton) e.getSource()).getText();
        if(source.equals(userView.addButton.getText())) { // ADD
            productStore.add(new Product(userView.getNewProductName()));
        }else if(source.equals(userView.deleteButton.getText())) { // DELETE
            int index = userView.list.getSelectedIndex();
            productStore.remove(index);
        }else if(source.equals(userView.changeButton.getText())) { // CHANGE
            int index = userView.list.getSelectedIndex();
            int quantity = userView.getNewProductQuantity();
            productStore.changeQuantity(index,quantity);
        }
    }
}
