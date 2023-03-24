/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import model.Category;
import model.Producer;
import model.Product;

/**
 *
 * @author Dell
 */
public class ProductDAO extends DBContext {

    public int count() {
        try {
            String sql = "SELECT count([productID]) as Total\n"
                    + "      \n"
                    + "  FROM [PRJ301_Project].[dbo].[Products]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getAllProduct() {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "                                              ,p.[categoryID]\n"
                    + "                                              ,p.[producerID]\n"
                    + "                                              ,p.[productName]\n"
                    + "                                              ,p.[price]\n"
                    + "                                              ,p.[quantity]\n"
                    + "                                              ,p.[meters]\n"
                    + "                                              ,p.[color]\n"
                    + "                                              ,p.[wattage]\n"
                    + "                                              ,p.[chip]\n"
                    + "                                              ,p.[nguondien]\n"
                    + "                                              ,p.[nhietdomau]\n"
                    + "                                              ,p.[loiday]\n"
                    + "                                              ,p.[kichthuoc]\n"
                    + "                                              ,p.[tuoitho]\n"
                    + "                                              ,p.[dienap]\n"
                    + "                                              ,p.[chiutai]\n"
                    + "                                              ,p.[image]\n"
                    + "                                              ,p.[baohanh]\n"
                    + "                                              ,p.[productcreatetime]\n"
                    + "                                        	  ,c.[categoryName]\n"
                    + "                                              ,c.[describe]\n"
                    + "                                        	  ,d.[producerName]\n"
                    + "                                              ,d.[country]\n"
                    + "                                        \n"
                    + "                                          FROM [PRJ301_Project].[dbo].[Products] p inner join [PRJ301_Project].[dbo].Categories c \n"
                    + "                                          ON p.categoryID = c.categoryID inner join [PRJ301_Project].[dbo].Producers d\n"
                    + "                                          ON p.producerID = d.producerID";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                Producer d = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("country"));
                Product p = new Product(rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("meters"),
                        rs.getString("color"),
                        rs.getString("wattage"),
                        rs.getString("chip"),
                        rs.getString("nguondien"),
                        rs.getString("nhietdomau"),
                        rs.getInt("loiday"),
                        rs.getString("kichthuoc"),
                        rs.getString("tuoitho"),
                        rs.getString("dienap"),
                        rs.getString("chiutai"),
                        rs.getString("image"),
                        rs.getInt("baohanh"),
                        rs.getDate("productcreatetime"),
                        c,
                        d);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductbyProducerID(int producerID) {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "                          ,p.[categoryID]\n"
                    + "                          ,p.[producerID]\n"
                    + "                          ,p.[productName]\n"
                    + "                          ,p.[price]\n"
                    + "                          ,p.[quantity]\n"
                    + "                          ,p.[meters]\n"
                    + "                          ,p.[color]\n"
                    + "                          ,p.[wattage]\n"
                    + "                          ,p.[chip]\n"
                    + "                          ,p.[nguondien]\n"
                    + "                          ,p.[nhietdomau]\n"
                    + "                          ,p.[loiday]\n"
                    + "                          ,p.[kichthuoc]\n"
                    + "                          ,p.[tuoitho]\n"
                    + "                          ,p.[dienap]\n"
                    + "                          ,p.[chiutai]\n"
                    + "                          ,p.[image]\n"
                    + "                          ,p.[baohanh]\n"
                    + "                          ,p.[productcreatetime]\n"
                    + "                    	  ,c.[categoryName]\n"
                    + "                          ,c.[describe]\n"
                    + "                    	  ,d.[producerName]\n"
                    + "                          ,d.[country]\n"
                    + "                    \n"
                    + "                      FROM [PRJ301_Project].[dbo].[Products] p inner join [PRJ301_Project].[dbo].Categories c \n"
                    + "                      ON p.categoryID = c.categoryID inner join [PRJ301_Project].[dbo].Producers d\n"
                    + "                      ON p.producerID = d.producerID\n"
                    + "                      Where d.producerID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, producerID);
            ResultSet rs = st.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                Producer d = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("country"));
                Product p = new Product(rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("meters"),
                        rs.getString("color"),
                        rs.getString("wattage"),
                        rs.getString("chip"),
                        rs.getString("nguondien"),
                        rs.getString("nhietdomau"),
                        rs.getInt("loiday"),
                        rs.getString("kichthuoc"),
                        rs.getString("tuoitho"),
                        rs.getString("dienap"),
                        rs.getString("chiutai"),
                        rs.getString("image"),
                        rs.getInt("baohanh"),
                        rs.getDate("productcreatetime"),
                        c,
                        d);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getNewProduct() {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "      ,p.[categoryID]\n"
                    + "      ,p.[producerID]\n"
                    + "      ,p.[productName]\n"
                    + "      ,p.[price]\n"
                    + "      ,p.[quantity]\n"
                    + "      ,p.[meters]\n"
                    + "      ,p.[color]\n"
                    + "      ,p.[wattage]\n"
                    + "      ,p.[chip]\n"
                    + "      ,p.[nguondien]\n"
                    + "      ,p.[nhietdomau]\n"
                    + "      ,p.[loiday]\n"
                    + "      ,p.[kichthuoc]\n"
                    + "      ,p.[tuoitho]\n"
                    + "      ,p.[dienap]\n"
                    + "      ,p.[chiutai]\n"
                    + "      ,p.[image]\n"
                    + "      ,p.[baohanh]\n"
                    + "      ,p.[productcreatetime]\n"
                    + "	  ,c.[categoryName]\n"
                    + "      ,c.[describe]\n"
                    + "	  ,d.[producerName]\n"
                    + "      ,d.[country]\n"
                    + "\n"
                    + "  FROM [PRJ301_Project].[dbo].[Products] p inner join [PRJ301_Project].[dbo].Categories c \n"
                    + "  ON p.categoryID = c.categoryID inner join [PRJ301_Project].[dbo].Producers d\n"
                    + "  ON p.producerID = d.producerID\n"
                    + "  Where DATEDIFF(day, GETDATE(), productcreatetime) <= 7";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                Producer d = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("country"));
                Product p = new Product(rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("meters"),
                        rs.getString("color"),
                        rs.getString("wattage"),
                        rs.getString("chip"),
                        rs.getString("nguondien"),
                        rs.getString("nhietdomau"),
                        rs.getInt("loiday"),
                        rs.getString("kichthuoc"),
                        rs.getString("tuoitho"),
                        rs.getString("dienap"),
                        rs.getString("chiutai"),
                        rs.getString("image"),
                        rs.getInt("baohanh"),
                        rs.getDate("productcreatetime"),
                        c,
                        d);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductbyProductID(int ProductID) {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "                                              ,p.[categoryID]\n"
                    + "                                              ,p.[producerID]\n"
                    + "                                              ,p.[productName]\n"
                    + "                                              ,p.[price]\n"
                    + "                                              ,p.[quantity]\n"
                    + "                                              ,p.[meters]\n"
                    + "                                              ,p.[color]\n"
                    + "                                              ,p.[wattage]\n"
                    + "                                              ,p.[chip]\n"
                    + "                                              ,p.[nguondien]\n"
                    + "                                              ,p.[nhietdomau]\n"
                    + "                                              ,p.[loiday]\n"
                    + "                                              ,p.[kichthuoc]\n"
                    + "                                              ,p.[tuoitho]\n"
                    + "                                              ,p.[dienap]\n"
                    + "                                              ,p.[chiutai]\n"
                    + "                                              ,p.[image]\n"
                    + "                                              ,p.[baohanh]\n"
                    + "                                              ,p.[productcreatetime]\n"
                    + "                                        	  ,c.[categoryName]\n"
                    + "                                              ,c.[describe]\n"
                    + "                                        	  ,d.[producerName]\n"
                    + "                                              ,d.[country]\n"
                    + "                                        \n"
                    + "                                          FROM [PRJ301_Project].[dbo].[Products] p inner join [PRJ301_Project].[dbo].Categories c \n"
                    + "                                          ON p.categoryID = c.categoryID inner join [PRJ301_Project].[dbo].Producers d\n"
                    + "                                          ON p.producerID = d.producerID\n"
                    + "                                          Where p.productID =  ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ProductID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                Producer d = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("country"));
                Product p = new Product(rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("meters"),
                        rs.getString("color"),
                        rs.getString("wattage"),
                        rs.getString("chip"),
                        rs.getString("nguondien"),
                        rs.getString("nhietdomau"),
                        rs.getInt("loiday"),
                        rs.getString("kichthuoc"),
                        rs.getString("tuoitho"),
                        rs.getString("dienap"),
                        rs.getString("chiutai"),
                        rs.getString("image"),
                        rs.getInt("baohanh"),
                        rs.getDate("productcreatetime"),
                        c,
                        d);
                return p;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductByCategoryID(int categoryID) {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "                                              ,p.[categoryID]\n"
                    + "                                              ,p.[producerID]\n"
                    + "                                              ,p.[productName]\n"
                    + "                                              ,p.[price]\n"
                    + "                                              ,p.[quantity]\n"
                    + "                                              ,p.[meters]\n"
                    + "                                              ,p.[color]\n"
                    + "                                              ,p.[wattage]\n"
                    + "                                              ,p.[chip]\n"
                    + "                                              ,p.[nguondien]\n"
                    + "                                              ,p.[nhietdomau]\n"
                    + "                                              ,p.[loiday]\n"
                    + "                                              ,p.[kichthuoc]\n"
                    + "                                              ,p.[tuoitho]\n"
                    + "                                              ,p.[dienap]\n"
                    + "                                              ,p.[chiutai]\n"
                    + "                                              ,p.[image]\n"
                    + "                                              ,p.[baohanh]\n"
                    + "                                              ,p.[productcreatetime]\n"
                    + "                                        	  ,c.[categoryName]\n"
                    + "                                              ,c.[describe]\n"
                    + "                                        	  ,d.[producerName]\n"
                    + "                                              ,d.[country]\n"
                    + "                                        \n"
                    + "                                          FROM [PRJ301_Project].[dbo].[Products] p inner join [PRJ301_Project].[dbo].Categories c \n"
                    + "                                          ON p.categoryID = c.categoryID inner join [PRJ301_Project].[dbo].Producers d\n"
                    + "                                          ON p.producerID = d.producerID\n"
                    + "                                          Where 1=1";
            if (categoryID != 0) {
                sql += " AND p.categoryID = " + categoryID;
            }
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                Producer d = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("country"));
                Product p = new Product(rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("meters"),
                        rs.getString("color"),
                        rs.getString("wattage"),
                        rs.getString("chip"),
                        rs.getString("nguondien"),
                        rs.getString("nhietdomau"),
                        rs.getInt("loiday"),
                        rs.getString("kichthuoc"),
                        rs.getString("tuoitho"),
                        rs.getString("dienap"),
                        rs.getString("chiutai"),
                        rs.getString("image"),
                        rs.getInt("baohanh"),
                        rs.getDate("productcreatetime"),
                        c,
                        d);
                list.add(p);
            }
            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductByProducerID(int[] producerID) {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "                                              ,p.[categoryID]\n"
                    + "                                              ,p.[producerID]\n"
                    + "                                              ,p.[productName]\n"
                    + "                                              ,p.[price]\n"
                    + "                                              ,p.[quantity]\n"
                    + "                                              ,p.[meters]\n"
                    + "                                              ,p.[color]\n"
                    + "                                              ,p.[wattage]\n"
                    + "                                              ,p.[chip]\n"
                    + "                                              ,p.[nguondien]\n"
                    + "                                              ,p.[nhietdomau]\n"
                    + "                                              ,p.[loiday]\n"
                    + "                                              ,p.[kichthuoc]\n"
                    + "                                              ,p.[tuoitho]\n"
                    + "                                              ,p.[dienap]\n"
                    + "                                              ,p.[chiutai]\n"
                    + "                                              ,p.[image]\n"
                    + "                                              ,p.[baohanh]\n"
                    + "                                              ,p.[productcreatetime]\n"
                    + "                                        	  ,c.[categoryName]\n"
                    + "                                              ,c.[describe]\n"
                    + "                                        	  ,d.[producerName]\n"
                    + "                                              ,d.[country]\n"
                    + "                                        \n"
                    + "                                          FROM [PRJ301_Project].[dbo].[Products] p inner join [PRJ301_Project].[dbo].Categories c \n"
                    + "                                          ON p.categoryID = c.categoryID inner join [PRJ301_Project].[dbo].Producers d\n"
                    + "                                          ON p.producerID = d.producerID\n"
                    + "                                          Where 1=1";
            if (producerID != null) {
                sql += " AND p.producerID IN ( ";
                for (int i = 0; i < producerID.length; i++) {
                    if (i == producerID.length - 1) {
                        sql += producerID[i] + " )";
                    } else {
                        sql += producerID[i] + ", ";
                    }
                }
            }
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                Producer d = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("country"));
                Product p = new Product(rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("meters"),
                        rs.getString("color"),
                        rs.getString("wattage"),
                        rs.getString("chip"),
                        rs.getString("nguondien"),
                        rs.getString("nhietdomau"),
                        rs.getInt("loiday"),
                        rs.getString("kichthuoc"),
                        rs.getString("tuoitho"),
                        rs.getString("dienap"),
                        rs.getString("chiutai"),
                        rs.getString("image"),
                        rs.getInt("baohanh"),
                        rs.getDate("productcreatetime"),
                        c,
                        d);
                list.add(p);
            }
            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductBySearch(String search) {
        try {
            String sql = "SELECT p.[productID]\n"
                    + "                                              ,p.[categoryID]\n"
                    + "                                              ,p.[producerID]\n"
                    + "                                              ,p.[productName]\n"
                    + "                                              ,p.[price]\n"
                    + "                                              ,p.[quantity]\n"
                    + "                                              ,p.[meters]\n"
                    + "                                              ,p.[color]\n"
                    + "                                              ,p.[wattage]\n"
                    + "                                              ,p.[chip]\n"
                    + "                                              ,p.[nguondien]\n"
                    + "                                              ,p.[nhietdomau]\n"
                    + "                                              ,p.[loiday]\n"
                    + "                                              ,p.[kichthuoc]\n"
                    + "                                              ,p.[tuoitho]\n"
                    + "                                              ,p.[dienap]\n"
                    + "                                              ,p.[chiutai]\n"
                    + "                                              ,p.[image]\n"
                    + "                                              ,p.[baohanh]\n"
                    + "                                              ,p.[productcreatetime]\n"
                    + "                                        	  ,c.[categoryName]\n"
                    + "                                              ,c.[describe]\n"
                    + "                                        	  ,d.[producerName]\n"
                    + "                                              ,d.[country]\n"
                    + "                                        \n"
                    + "                                          FROM [PRJ301_Project].[dbo].[Products] p inner join [PRJ301_Project].[dbo].Categories c \n"
                    + "                                          ON p.categoryID = c.categoryID inner join [PRJ301_Project].[dbo].Producers d\n"
                    + "                                          ON p.producerID = d.producerID\n"
                    + "                                          Where p.productName like ? or c.categoryName like ? or d.producerName like ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setString(2, "%" + search + "%");
            st.setString(3, "%" + search + "%");

            ResultSet rs = st.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                Producer d = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("country"));
                Product p = new Product(rs.getInt("productID"),
                        rs.getString("productName"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("meters"),
                        rs.getString("color"),
                        rs.getString("wattage"),
                        rs.getString("chip"),
                        rs.getString("nguondien"),
                        rs.getString("nhietdomau"),
                        rs.getInt("loiday"),
                        rs.getString("kichthuoc"),
                        rs.getString("tuoitho"),
                        rs.getString("dienap"),
                        rs.getString("chiutai"),
                        rs.getString("image"),
                        rs.getInt("baohanh"),
                        rs.getDate("productcreatetime"),
                        c,
                        d);
                list.add(p);
            }
            return list;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void delete(int productID) {
        try {
            String sql = "DELETE FROM [dbo].[Products]\n"
                    + "      WHERE productID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(Product p) {
        try {
            String sql = "INSERT INTO [dbo].[Products]\n"
                    + "           ([categoryID]\n"
                    + "           ,[producerID]\n"
                    + "           ,[productName]\n"
                    + "           ,[price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[meters]\n"
                    + "           ,[color]\n"
                    + "           ,[wattage]\n"
                    + "           ,[chip]\n"
                    + "           ,[nguondien]\n"
                    + "           ,[nhietdomau]\n"
                    + "           ,[loiday]\n"
                    + "           ,[kichthuoc]\n"
                    + "           ,[tuoitho]\n"
                    + "           ,[dienap]\n"
                    + "           ,[chiutai]\n"
                    + "           ,[image]\n"
                    + "           ,[baohanh]\n"
                    + "           ,[productcreatetime])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, p.getCate().getCategoryID());
            st.setInt(2, p.getProd().getProducerID());
            st.setString(3, p.getProductName());
            st.setDouble(4, p.getPrice());
            st.setInt(5, p.getQuantity());
            st.setString(6, p.getMeters());
            st.setString(7, p.getColor());
            st.setString(8, p.getWattage());
            st.setString(9, p.getChip());
            st.setString(10, p.getNguondien());
            st.setString(11, p.getNhietdomau());
            st.setInt(12, p.getLoiday());
            st.setString(13, p.getKichthuoc());
            st.setString(14, p.getTuoitho());
            st.setString(15, p.getDienap());
            st.setString(16, p.getChiutai());
            st.setString(17, p.getImage());
            st.setInt(18, p.getBaohanh());
            st.setDate(19, p.getProductcreatetime());

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int lastProductID() {
        try {
            String sql = "SELECT TOP (1) [productID]\n"
                    + "      \n"
                    + "  FROM [PRJ301_Project].[dbo].[Products]\n"
                    + "  ORder by productID desc";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public void insertCate(Category c) {
        try {
            String sql = "INSERT INTO [dbo].[Categories]([categoryName],[describe])\n"
                    + "VALUES(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCategoryName());
            st.setString(2, c.getDescribe());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int lastCategoryID() {
        try {
            String sql = "SELECT TOP (1) [categoryID]\n"
                    + "      \n"
                    + "  FROM [PRJ301_Project].[dbo].[Categories]\n"
                    + "  ORder by categoryID desc";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;

    }

    public Double getTotalPay() {
        try {
            String sql = "SELECT \n"
                    + "      sum([total]) as 'Total'\n"
                    + "      \n"
                    + "  FROM [PRJ301_Project].[dbo].[Orders]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;  
    }
    
    public String getPriceFormat(double pay){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat vn = NumberFormat.getInstance(localeVN);
        return vn.format(pay);
    }

}
