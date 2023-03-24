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
import model.Category;

/**
 *
 * @author Dell
 */
public class CategoryDAO extends DBContext {

    public List<Category> getCategoryID() {
        try {
            String sql = "SELECT [categoryID] \n"
                    + "		,[categoryName] \n"
                    + "		,[describe]\n"
                    + "FROM [PRJ301_Project].[dbo].[Categories]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Category getCategoryIDByCategory(int CategoryID) {
        try {
            String sql = "SELECT  c.[categoryID] \n"
                    + "		,c.[categoryName] \n"
                    + "		,c.[describe]\n"
                    + "FROM [PRJ301_Project].[dbo].[Categories] c join [PRJ301_Project].[dbo].[Products] p\n"
                    + "ON c.categoryID = p.categoryID\n"               
                    + "WHERE c.categoryID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, CategoryID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("describe"));
                return c;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
