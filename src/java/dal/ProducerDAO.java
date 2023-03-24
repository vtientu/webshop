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
import model.Producer;

/**
 *
 * @author Dell
 */
public class ProducerDAO extends DBContext {

    public List<Producer> getAll() {
        try {

            String sql = "SELECT [producerID]\n"
                    + "      ,[producerName]\n"
                    + "      ,[country]\n"
                    + "  FROM [PRJ301_Project].[dbo].[Producers]";

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            List<Producer> list = new ArrayList<>();
            while (rs.next()) {
                Producer p = new Producer(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Producer getProducerByID(int producerID) {
        try {

            String sql = "SELECT [producerID]\n"
                    + "      ,[producerName]\n"
                    + "      ,[country]\n"
                    + "  FROM [PRJ301_Project].[dbo].[Producers]"
                    + " where producerID = ?";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, producerID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Producer p = new Producer(rs.getInt(1), rs.getString(2), rs.getString(3));
                return p;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertProducer(Producer prod) {
        try {
            String sql = "INSERT INTO [dbo].[Producers]\n"
                    + "           ([producerName]\n"
                    + "           ,[country])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, prod.getProducerName());
            st.setString(2, prod.getCountry());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
