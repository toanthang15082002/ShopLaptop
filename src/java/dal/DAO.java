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
import model.Category;
import model.Product;
import model.QuantityProductByCategory;

/**
 *
 * @author Thang
 */
public class DAO extends DBContext {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getBestSeller() {
        String query = "select top 1 * from product\n"
                + "order by sell desc";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getBestProduct() {
        String query = "select top 1 * from product\n"
                + "order by price desc";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductByCategoryID(String categoryID) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where categoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(String ID) {
        String query = "select * from product\n"
                + "where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalProduct() {
        String query = "select count(id) from product";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "order by ID\n"
                + "offset ? rows fetch next 12 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, (index - 1) * 12);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> pagingProductManager(int index) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "order by ID\n"
                + "offset ? rows fetch next 5 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [title] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchByPrice(String price1, String price2) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where price > ? and price < ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, price1);
            st.setString(2, price2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> sortByPriceAsc() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "order by price asc";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> sortByPriceDesc() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "order by price desc";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account login(String user, String pass) {
        String query = "select * from account\n"
                + "where [username] = ?\n"
                + "and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public Account checkUsername(String user) {
        String query = "select * from account\n"
                + "where [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getString(5)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkName(String name) {
        String query = "select * from account\n"
                + "where [name] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getString(5)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void signup(String user, String pass, String name) {
        String query = "insert into account values(?,?,0,?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, user);
            st.setString(2, pass);
            st.setString(3, name);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void change(Account a) {
        String sql = "update account set password = ?, name = ?\n"
                + "where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setString(2, a.getUsername());
            st.setString(3, a.getName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void delete(String id) {
        String query = "delete from product\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(String id, String name, String image, String price, String title, String description,
            String categoryID, String cpu, String gpu, String ram, String screen, String disk) {
        String query = "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, id);
            st.setString(2, name);
            st.setString(3, image);
            st.setString(4, price);
            st.setString(5, title);
            st.setString(6, description);
            st.setString(7, categoryID);
            st.setString(8, cpu);
            st.setString(9, gpu);
            st.setString(10, ram);
            st.setString(11, screen);
            st.setString(12, disk);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void edit(String id, String name, String image, int price, String title, String description,
            String categoryID, String cpu, String gpu, String ram, String screen, String disk) {
        String query = "update product\n"
                + "set [name] = ?,\n"
                + "img = ?,\n"
                + "price = ?,\n"
                + "title = ?,\n"
                + "[description] = ?,\n"
                + "categoryID = ?,\n"
                + "CPU = ?,\n"
                + "GPU = ?,\n"
                + "RAM = ?,\n"
                + "Screen = ?,\n"
                + "[Disk] = ?\n"
                + "where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(12, id);
            st.setString(1, name);
            st.setString(2, image);
            st.setInt(3, price);
            st.setString(4, title);
            st.setString(5, description);
            st.setString(6, categoryID);
            st.setString(7, cpu);
            st.setString(8, gpu);
            st.setString(9, ram);
            st.setString(10, screen);
            st.setString(11, disk);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int countTotalProductSell() {
        String query = "select sum(sell) from product";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<QuantityProductByCategory> getQuanProductBycate() {
        List<QuantityProductByCategory> list = new ArrayList<>();
        String sql = "select c.[name] , count(p.categoryID) as 'numCate' \n"
                + "from product p inner join category c on p.categoryID = c.categoryID\n"
                + "Group by p.categoryID, c.[name]";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                QuantityProductByCategory q = new QuantityProductByCategory();
                q.setName(rs.getString(1));
                q.setNumCate(rs.getString(2));
                list.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
