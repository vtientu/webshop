/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Account;
import model.Cart;
import model.Item;


public class CartDAO extends DBContext {

    public void addToOrder(Account a, Cart cart) {
        try {

            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([accountID]\n"
                    + "           ,[total]\n"
                    + "           ,[createAt])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getAccountID());
            st.setDouble(2, cart.getTotalMoney());
            st.setDate(3, getCurrentDate());
            st.executeUpdate();

            String sql1 = "SELECT TOP(1) orderID FROM [dbo].[Orders] ORDER BY orderID DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                for (Item item : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderLine]\n"
                            + "           ([orderID]\n"
                            + "           ,[productID]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, rs.getInt(1));
                    st2.setInt(2, item.getProduct().getProductID());
                    st2.setInt(3, item.getQuantity());
                    st2.setDouble(4, item.getPrice());
                    st2.executeUpdate();
                    if ( (item.getProduct().getQuantity() - item.getQuantity() ) >= 0) {
                        String sql3 = "UPDATE [dbo].[Products]\n"
                                + "   SET quantity = quantity - ?\n"
                                + " WHERE productID = ?";
                        PreparedStatement st3 = connection.prepareStatement(sql3);
                        st3.setInt(1, item.getQuantity());
                        st3.setInt(2, item.getProduct().getProductID());
                        st3.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Date getCurrentDate() {
        LocalDate curDate = java.time.LocalDate.now();
        return Date.valueOf(curDate.toString());
    }
}
