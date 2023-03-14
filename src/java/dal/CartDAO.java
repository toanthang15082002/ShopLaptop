/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author Thang
 */
public class CartDAO extends DBContext {

    public void addOrder(Account a, Cart c) {
        try {
            String query = "insert into [bill] values(?,?)";
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, a.getId());
            st.setInt(2, c.getAmount());
            st.executeUpdate();

            //lay ra id cua hoa don vua add
            String query1 = "select top 1 billID from [bill] order by billID desc";
            PreparedStatement st1 = connection.prepareStatement(query1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int billID = rs.getInt(1);
                for (Item item : c.getItem()) {
                    String query2 = "insert into [order] values(?,?,?,?)";
                    String query3 = "update product set sell = sell + ?\n"
                            + "where ID = ?";
                    PreparedStatement st2 = connection.prepareStatement(query2);
                    PreparedStatement st3 = connection.prepareStatement(query3);

                    st2.setInt(1, billID);
                    st2.setInt(2, item.getProduct().getId());
                    st2.setInt(3, item.getQuantity());
                    st2.setInt(4, item.getPrice());
                    st3.setInt(1, item.getQuantity());
                    st3.setInt(2, item.getProduct().getId());
                    st2.executeUpdate();
                    st3.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> getOrder() {
        List<Order> list = new ArrayList<>();
        String query = "select * from [order]";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        Product p = new Product(1,
                "Acer Nitro Eagle",
                "https://bizweb.dktcdn.net/100/408/235/products/gaming-acer-nitro-5-eagle.jpg?v=1636346818687",
                20999000,
                "Laptop gaming Acer Nitro 5 Eagle AN515 57 54MV",
                "Cấu hình mạnh mẽ, vượt trội. Thiết kế mạnh mẽ. Màn hình FullHD với kích thước 15.6 inch. Khả năng tản nhiệt nhanh",
                "i5-11400H",
                "RTX 3050",
                "8GB",
                "15.6\"FHD 144Hz",
                "521GB",
                0);
        Item i = new Item(p, 1, 15000000);
        List<Item> item = new ArrayList<>();
        item.add(i);
        Account a = new Account(1, "thang", "123456", false, "thang");
        Cart c = new Cart(item);
        dao.addOrder(a, c);
        System.out.println();
    }
}
