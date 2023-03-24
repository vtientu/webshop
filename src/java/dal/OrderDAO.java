/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import model.Account;
import model.Category;
import model.Order;
import model.OrderLine;
import model.Producer;
import model.Product;
import model.Profiles;

/**
 *
 * @author Dell
 */
public class OrderDAO extends DBContext {

    public int count() {
        try {
            String sql = "  SELECT count([orderID]) as Total\n"
                    + "      \n"
                    + "  FROM [PRJ301_Project].[dbo].[Orders]";
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

    public Date getCurrentDateForJSP() {
        LocalDate curDate = java.time.LocalDate.now();
        return Date.valueOf(curDate.toString());
    }

    public double getTotalAmount(int month, int year) {
        try {

            String sql = "SELECT SUM([total])\n"
                    + "  FROM [PRJ301_Project].[dbo].[Orders]\n"
                    + "  WHERE month([createAt]) = ? and year([createAt]) = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public String getTotalAmountFormat(int month, int year) {
        Locale vn = new Locale("vi", "VN");
        NumberFormat f = NumberFormat.getInstance(vn);
        return f.format(getTotalAmount(month, year));
    }

    public List<Order> getOrder() {
        try {
            String sql = "SELECT\n"
                    + "    o.[orderID]\n"
                    + "    ,o.[accountID]\n"
                    + "    ,o.[total]\n"
                    + "    ,o.[createAt]\n"
                    + "    ,a.[userName]\n"
                    + "    ,a.[password]\n"
                    + "    ,a.[amount]\n"
                    + "    ,a.[email]\n"
                    + "    ,a.[role]\n"
                    + "    ,pf.[firstName]\n"
                    + "    ,pf.[lastName]\n"
                    + "    ,pf.[avatar]\n"
                    + "    ,pf.[country]\n"
                    + "    ,pf.[address]\n"
                    + "    ,pf.[birthday]\n"
                    + "    ,pf.[phone]\n"
                    + "    ,pf.[gender]\n"
                    + "    FROM [PRJ301_Project].[dbo].[Orders] o inner join [PRJ301_Project].[dbo].[Accounts] a \n"
                    + "    ON o.accountID = a.accountID inner join [PRJ301_Project].[dbo].[Profiles] pf \n"
                    + "    ON o.accountID = pf.accountID \n"
                    + "	ORDER BY o.[createAt] DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                Profiles pf = new Profiles(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("avatar"),
                        rs.getString("country"), rs.getString("address"), rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"));
                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getInt("role"), pf);
                Order o = new Order(rs.getInt("orderID"), rs.getDouble("total"), rs.getDate("createAt"), a);
                list.add(o);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<OrderLine> getOrderLine(int id) {
        try {
            String sql = "SELECT\n"
                    + "      ol.[orderID]\n"
                    + "      ,ol.[productID]\n"
                    + "      ,ol.[quantity]\n"
                    + "      ,ol.[price]\n"
                    + "      ,o.[accountID]\n"
                    + "      ,o.[total]\n"
                    + "      ,o.[createAt]\n"
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
                    + "      ,a.[userName]\n"
                    + "      ,a.[password]\n"
                    + "      ,a.[amount]\n"
                    + "      ,a.[email]\n"
                    + "      ,a.[role]\n"
                    + "      ,pf.[firstName]\n"
                    + "      ,pf.[lastName]\n"
                    + "      ,pf.[avatar]\n"
                    + "      ,pf.[country]\n"
                    + "      ,pf.[address]\n"
                    + "      ,pf.[birthday]\n"
                    + "      ,pf.[phone]\n"
                    + "      ,pf.[gender]\n"
                    + "      ,c.[categoryName]\n"
                    + "      ,c.[describe]\n"
                    + "      ,pd.[producerName]\n"
                    + "      ,pd.[country]\n"
                    + "      FROM [PRJ301_Project].[dbo].[OrderLine] ol inner join [PRJ301_Project].[dbo].[Orders] o\n"
                    + "      ON ol.orderID = o.orderID inner join [PRJ301_Project].[dbo].[Products] p \n"
                    + "      ON ol.productID = p.productID inner join [PRJ301_Project].[dbo].[Accounts] a \n"
                    + "      ON o.accountID = a.accountID inner join [PRJ301_Project].[dbo].[Profiles] pf \n"
                    + "      ON o.accountID = pf.accountID inner join  [PRJ301_Project].[dbo].[Categories] c\n"
                    + "      ON p.categoryID = c.categoryID inner join  [PRJ301_Project].[dbo].[Producers] pd\n"
                    + "      ON pd.producerID = p.producerID\n"
                    + "      WHERE ol.orderID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            List<OrderLine> list = new ArrayList<>();
            while (rs.next()) {
                Profiles pf = new Profiles(rs.getInt("accountID"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("avatar"),
                        rs.getString("country"), rs.getString("address"), rs.getDate("birthday"), rs.getString("phone"), rs.getInt("gender"));
                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), rs.getString("password"),
                        rs.getDouble("amount"), rs.getString("email"), rs.getInt("role"), pf);

                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));

                Producer pd = new Producer(rs.getInt("producerID"), rs.getString("producerName"), rs.getString("country"));

                Product p = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getDouble("price"), rs.getInt("quantity"), rs.getString("meters"),
                        rs.getString("color"), rs.getString("wattage"), rs.getString("chip"), rs.getString("nguondien"), rs.getString("nhietdomau"),
                        rs.getInt("loiday"), rs.getString("kichthuoc"), rs.getString("tuoitho"), rs.getString("dienap"), rs.getString("chiutai"),
                        rs.getString("image"), rs.getInt("baohanh"), rs.getDate("productcreatetime"), c, pd);

                Order o = new Order(rs.getInt("orderID"), rs.getDouble("total"), rs.getDate("createAt"), a);

                OrderLine ol = new OrderLine(rs.getInt("quantity"), rs.getDouble("price"), o, p);

                list.add(ol);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
