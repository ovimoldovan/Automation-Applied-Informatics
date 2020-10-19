package g30321.moldovan.ovidiu.l12.e1;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Observable;
import java.util.Observer;


public class UserView extends JPanel implements Observer {
    JScrollPane listScroll;
    JList list;
    DefaultListModel model;
    JTextField nameField;
    JTextField quantityField;
    JButton addButton;
    JButton deleteButton;
    JButton changeButton;

    public UserView() {
        model = new DefaultListModel();
        list = new JList(model);
        listScroll = new JScrollPane(list);
        list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

        nameField = new JTextField(1);
        quantityField = new JTextField(1);
        addButton = new JButton("Add");
        deleteButton = new JButton("Delete");
        changeButton = new JButton("Change");
        setLayout(new GridLayout(2, 2));

        add(listScroll);
        add(nameField);
        add(quantityField);
        add(deleteButton);
        add(addButton);
        add(changeButton);
        setSize(300, 400);
        setVisible(true);

    }

    public void setActionListener(ActionListener actionListener) {
        addButton.addActionListener(actionListener);
        deleteButton.addActionListener(actionListener);
        changeButton.addActionListener(actionListener);
    }

    @Override
    public void update(Observable o, Object arg) {
        if (model.getSize() != ((ProductStore) o).getSize()) { // a product was added or removed
            model.clear();
            for (Product produs : ((ProductStore) o).products) {
                model.addElement(produs);
            }
        }
        repaint();
    }

    public String getNewProductName() {
        return nameField.getText().trim();
    }
    public int getNewProductQuantity() {
        return Integer.parseInt(quantityField.getText().trim());
    }
}