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
import model.Product;
import model.Profiles;
import sun.java2d.cmm.Profile;

/**
 *
 * @author Dell
 */
public class AccountDAO extends DBContext {

    public Account checkLogin(String userName, String password) {
        try {
            String sql = "SELECT [Accounts].[accountID]\n"
                    + "      ,[userName]\n"
                    + "      ,[password]\n"
                    + "      ,[amount]\n"
                    + "      ,[email]\n"
                    + "      ,[role]\n"
                    + "      ,[firstName]\n"
                    + "      ,[lastName]\n"
                    + "      ,[avatar]\n"
                    + "      ,[country]\n"
                    + "      ,[address]\n"
                    + "      ,[birthday]\n"
                    + "      ,[phone]\n"
                    + "      ,[gender]\n"
                    + "  FROM [PRJ301_Project].[dbo].[Accounts] inner join [PRJ301_Project].[dbo].[Profiles]\n"
                    + "  ON [PRJ301_Project].[dbo].[Accounts].accountID = [PRJ301_Project].[dbo].[Profiles].accountID\n"
                    + "  WHERE userName = ? AND password = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Profiles p = new Profiles();
                p.setAccountID(rs.getInt(1));
                p.setFirstName(rs.getString(7));
                p.setLastName(rs.getString(8));
                p.setAvatar(rs.getString(9));
                p.setCountry(rs.getString(10));
                p.setAddress(rs.getString(11));
                p.setBirthday(rs.getDate("birthday"));
                p.setPhone(rs.getString(13));
                p.setGender(rs.getInt(14));

                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        p);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkLoginAdmin(String userName, String password) {
        try {
            String sql = "SELECT [Accounts].[accountID]\n"
                    + "      ,[userName]\n"
                    + "      ,[password]\n"
                    + "      ,[amount]\n"
                    + "      ,[email]\n"
                    + "      ,[role]\n"
                    + "      ,[firstName]\n"
                    + "      ,[lastName]\n"
                    + "      ,[avatar]\n"
                    + "      ,[country]\n"
                    + "      ,[address]\n"
                    + "      ,[birthday]\n"
                    + "      ,[phone]\n"
                    + "      ,[gender]\n"
                    + "  FROM [PRJ301_Project].[dbo].[Accounts] inner join [PRJ301_Project].[dbo].[Profiles]\n"
                    + "  ON [PRJ301_Project].[dbo].[Accounts].accountID = [PRJ301_Project].[dbo].[Profiles].accountID\n"
                    + "  WHERE userName = ? AND password = ? AND role not in(0)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Profiles p = new Profiles();
                p.setAccountID(rs.getInt(1));
                p.setFirstName(rs.getString(7));
                p.setLastName(rs.getString(8));
                p.setAvatar(rs.getString(9));
                p.setCountry(rs.getString(10));
                p.setAddress(rs.getString(11));
                p.setBirthday(rs.getDate(12));
                p.setPhone(rs.getString(13));
                p.setGender(rs.getInt(14));

                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        p);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account checkRegister(String userName) {
        try {
            String sql = "SELECT [Accounts].[accountID]\n"
                    + "      ,[userName]\n"
                    + "      ,[password]\n"
                    + "      ,[amount]\n"
                    + "      ,[email]\n"
                    + "      ,[role]\n"
                    + "      ,[firstName]\n"
                    + "      ,[lastName]\n"
                    + "      ,[avatar]\n"
                    + "      ,[country]\n"
                    + "      ,[address]\n"
                    + "      ,[birthday]\n"
                    + "      ,[phone]\n"
                    + "      ,[gender]\n"
                    + "  FROM [PRJ301_Project].[dbo].[Accounts] inner join [PRJ301_Project].[dbo].[Profiles]\n"
                    + "  ON [PRJ301_Project].[dbo].[Accounts].accountID = [PRJ301_Project].[dbo].[Profiles].accountID\n"
                    + "  WHERE userName = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Profiles p = new Profiles();
                p.setAccountID(rs.getInt(1));
                p.setFirstName(rs.getString(7));
                p.setLastName(rs.getString(8));
                p.setAvatar(rs.getString(9));
                p.setCountry(rs.getString(10));
                p.setAddress(rs.getString(11));
                p.setBirthday(rs.getDate(12));
                p.setPhone(rs.getString(13));
                p.setGender(rs.getInt(14));

                Account a = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        p);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void register(Account a) {
        try {
            String sql = "INSERT INTO [dbo].[Accounts]\n"
                    + "           ([userName]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUserName());
            st.setString(2, a.getPassword());
            st.setString(3, a.getEmail());
            st.setInt(4, 0);
            st.executeUpdate();
            String sql1 = "SELECT TOP 1 a.[accountID]  \n"
                    + "  FROM [PRJ301_Project].[dbo].[Accounts] a\n"
                    + "  Order by a.accountID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                String sql2 = "INSERT INTO [dbo].[Profiles]\n"
                        + "           ([accountID]\n"
                        + "           )\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           )";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, rs.getInt("accountID"));
                st2.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePass(int accountID, String password) {
        try {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "SET\n"
                    + "[password] = ?\n"
                    + "where accountID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, accountID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeProfile(Account a) {
        try {
            String sql = "UPDATE [dbo].[Accounts]\n"
                    + "   SET [email] = ?\n"
                    + " WHERE accountID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getEmail());
            st.setInt(2, a.getAccountID());
            st.executeUpdate();
            String sql1 = "UPDATE [dbo].[Profiles]\n"
                    + "   SET [firstName] = ?\n"
                    + "      ,[lastName] = ?\n"
                    + "      ,[avatar] = ?\n"
                    + "      ,[country] = ?\n"
                    + "      ,[address] = ?\n"
                    + "      ,[birthday] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[gender] = ?\n"
                    + " WHERE accountID = ?";
            PreparedStatement st2 = connection.prepareStatement(sql1);
            st2.setString(1, a.getPro().getFirstName());
            st2.setString(2, a.getPro().getLastName());
            st2.setString(3, a.getPro().getAvatar());
            st2.setString(4, a.getPro().getCountry());
            st2.setString(5, a.getPro().getAddress());
            st2.setDate(6, a.getPro().getBirthday());
            st2.setString(7, a.getPro().getPhone());
            st2.setInt(8, a.getPro().getGender());
            st2.setInt(9, a.getAccountID());
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Account> getAllCustomer() {
        try {
            String sql = "SELECT a.[accountID] \n"
                    + "	  ,a.userName\n"
                    + "      ,a.[email]\n"
                    + "      ,a.[role]\n"
                    + "	  ,p.phone\n"
                    + "	  ,p.country\n"
                    + "	  ,p.birthday\n"
                    + "  FROM [PRJ301_Project].[dbo].[Accounts] a join [PRJ301_Project].[dbo].[Profiles] p\n"
                    + "  ON a.accountID = p.accountID";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            List<Account> list = new ArrayList<>();
            while (rs.next()) {
                Profiles p = new Profiles(0, "", "", "", rs.getString("country"), "", rs.getDate("birthday"), rs.getString("phone"), 0);
                Account a = new Account(rs.getInt("accountID"), rs.getString("userName"), "", 0, rs.getString("email"), rs.getInt("role"), p);
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
