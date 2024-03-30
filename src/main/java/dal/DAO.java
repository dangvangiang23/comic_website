/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import model.*;
import utils.Connect;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author MSI
 */
public class DAO {

public  Connection connection = Connect.getConnection();
    public ArrayList<Account> findAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "select * from Account ";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean("role"));
                accounts.add(a);
            }
            return accounts;
        } catch (Exception e) {
            System.out.println("loi lay account");
        }
        return null;

    }


    public Account findAccount(String username, String password) {
        try(Connection connection = Connect.getConnection()) {
            String sql = "select * from Account where username = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("loi lay 1 account");
        }
        return null;

    }
    public ArrayList<Category> findCategory() {
        ArrayList<Category> cats = new ArrayList<>();
        try {
            String sql = "select * from Category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt(1));
                c.setCatname(rs.getString(2));
                cats.add(c);
            }
            return cats;
        } catch (Exception e) {
            System.out.println("loi lay all category");
        }
        return null;

    }

    public Author findAuthorByCid(int cid) {

        try {
            String sql = " select * from author a inner join comic c on a.authorid = c.authorid where c.cid= ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Author a = new Author();
                a.setAuthorid(rs.getInt(1));
                a.setAuthorname(rs.getString(2));
                return a;
            }

        } catch (Exception e) {
            System.out.println("loi lay author");
        }
        return null;

    }

    public ArrayList<Category> findlistCategoriesByCid(int cid) {

        ArrayList<Category> categories = new ArrayList<>();
        try {
            String sql = "select *\n"
                    + "                    from Category cate inner join Category_Comic\n"
                    + "                     catcom on catcom.catid = cate.catid\n"
                    + "                     inner join Comic c on c.cid = catcom.cid\n"
                    + "                     where c.cid= ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt(1));
                category.setCatname(rs.getString(2));
                categories.add(category);
            }
            return categories;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

    public ArrayList<Comic> findAllComic() {
        ArrayList<Comic> comics = new ArrayList<>();
        ArrayList<Category> cates = new ArrayList<>();
        try {
            String sql = "select * from Comic";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Comic c = new Comic();

                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                c.setDescription(rs.getString("description"));
                c.setAuthor(findAuthorByCid(rs.getInt("cid")));
                c.setStatus(rs.getString("status"));
                c.setCimage(rs.getString("cimage"));
                cates = findlistCategoriesByCid(rs.getInt("cid"));
                c.setCategories(cates);
                comics.add(c);
            }
            return comics;
        } catch (Exception e) {
            System.out.println("loi lay comic");
        }
        return null;

    }

    public void AddAccount(Account a) {

        String sql = "insert into Account values(?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getAccountid());
            st.setString(2, a.getUsername());
            st.setString(3, a.getPassword());
            st.setBoolean(4, a.isRole());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Chapter> findChapterComicByCid(int cid) {
        ArrayList<Chapter> chapters = new ArrayList();
        try {
            String sql = "select * from chapter where cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Chapter chap = new Chapter();
                Comic c = findComicByCid(cid);
                chap.setComic(c);
                chap.setChapname(rs.getString("chapname"));
                chap.setView(rs.getInt("view"));
                chap.setPublicdate(rs.getDate("publicdate"));
                chap.setChapid(rs.getInt("chapid"));
                chapters.add(chap);

            }
            return chapters;
        } catch (Exception e) {
            System.out.println("loi lay 1 account");
        }
        return null;
    }

    public Comic findComicByCid(int cid) {

        ArrayList<Category> cates = new ArrayList<>();
        try {
            String sql = "select * from Comic where cid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Comic c = new Comic();

                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                c.setDescription(rs.getString("description"));
                c.setAuthor(findAuthorByCid(rs.getInt("cid")));
                c.setStatus(rs.getString("status"));
                c.setCimage(rs.getString("cimage"));
                cates = findlistCategoriesByCid(rs.getInt("cid"));
                c.setCategories(cates);
                return c;

            }

        } catch (Exception e) {
            System.out.println("loi lay comic");
        }
        return null;

    }

    public ArrayList<String> findImagesPerChapterid(int chapid) {
        ArrayList<String> imgurls = new ArrayList();
        try {
            String sql = "select  * from Chapter_imagess \n"
                    + "where chapid = ?  and urlimg is not null";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, chapid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                imgurls.add(rs.getString(2));

            }
            return imgurls;

        } catch (Exception e) {
            System.out.println("Loi khong lay duoc chapter");
        }
        return null;
    }

    public int findViewbyCid(int cid) {
        String sql = "select sum([view]) from Chapter \n"
                + "where cid = ? \n"
                + "group by [cid]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Khong lay duoc view cua 1 comic");
        }
        return 0;
    }

    public Date findLatestDateByCId(int cid) {
        String sql = "select top 1 publicdate chapid from chapter \n"
                + "where cid= ? \n"
                + "order by publicdate desc ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getDate(1);
            }
        } catch (Exception e) {
            System.out.println("Khong lay duoc top 1 date");
        }
        return null;
    }

    public Chapter findChapterbychapid(int chapid) {
        String sql = "select * from chapter where chapid = ?  ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, chapid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setChapid(rs.getInt(1));
                chapter.setChapname(rs.getString(2));
                chapter.setView(rs.getInt(3));
                chapter.setChapid(chapid);
                return chapter;
            }

        } catch (Exception e) {
            System.out.println("Khong lay duoc top 1 date");
        }
        return null;
    }

    public Category findcategorybycatid(int catid) {
        String sql = "select * from Category where catid = ?  ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, catid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt(1));
                category.setCatname(rs.getString(2));

                return category;
            }

        } catch (Exception e) {
            System.out.println("Khong lay duoc category");
        }
        return null;
    }
//     public ArrayList<Comic> getComicByAuthor(){
//
//     }

    public int findCidByChapid(int chapid) {
        String sql = "select cid from chapter \n"
                + "where chapid= ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, chapid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {

                return rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println("Khong lay duoc category");
        }
        return -1;
    }

    //    public void AddComment(int chapterid, int readerid, String content, int commentid){
//        String sql = "insert into Comment values(?,?,?,?)";
//         try {
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, readerid );
//            stm.setString(2, content);
//            stm.setInt(3, commentid);
//            stm.setInt(4, chapterid);
//
//            stm.executeUpdate();
//
//        } catch (Exception e) {
//            System.out.println("Khong add duoc comment");
//        }
//
//
//    }
    public void UpdateAccount(String username, String password, int accountid) {
        String sql = "update account set username = ? , password= ? \n"
                + "where accountid= ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setInt(3, accountid);

            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Khong lay duoc category");
        }

    }

    public Chapter find1lastestChapterByCid(int cid) {
        String sql = "select top 1 cid, chapname, [view], publicdate, chapid  from chapter where cid= ? order by publicdate desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setChapid(rs.getInt("chapid"));
                chapter.setChapname(rs.getString("chapname"));
                chapter.setView(rs.getInt("view"));
                chapter.setPublicdate(rs.getDate("publicdate"));
                chapter.setComic(findComicByCid(cid));
                return chapter;

            }

        } catch (Exception e) {
            System.out.println("Khong lay duoc category");
        }

        return null;
    }

    public void AddComment(int commentid, String content, int chapid, int account, String username) {
        String sql = "insert into Comment values(?,?,?,?,?);";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, commentid);
            stm.setString(2, content);
            stm.setInt(3, chapid);
            stm.setString(4, username);
            stm.setInt(5, account);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Khong lay duoc category");
        }

    }

    public Account fndAccountbyAccountid(int accountid) {
        String sql = "select * from Account where accountid= ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setAccountid(rs.getInt("accountid"));
                a.setPassword(rs.getString("password"));
                a.setUsername(rs.getString("username"));
                a.setRole(rs.getBoolean("role"));
                return a;
            }

        } catch (Exception e) {
            System.out.println("Khong lay duoc account");
        }
        return null;

    }

    public ArrayList<Comic> findAllComicsByAuthorid(int authorid) {
        String sqlString = "select * from comic where authorid = ?";
        ArrayList<Comic> comics = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sqlString);
            stm.setInt(1, authorid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Comic c = new Comic();
//                findAuthorByCid
                c.setAuthor(findAuthorByCid(rs.getInt("cid")));
                c.setCname(rs.getString("cname"));
                c.setDescription(rs.getString("description"));
                c.setCimage(rs.getString("cimage"));
                c.setCid(rs.getInt("cid"));
                c.setStatus(rs.getString("status"));

                comics.add(c);
            }
            return comics;

        } catch (Exception e) {
            System.out.println("Khong lay duoc Comic by authorid");
        }
        return null;
    }

    public ArrayList<Comment> getAllComments() {
        String sql = "select * from comment order by commentid desc";
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Comment com = new Comment();
                com.setCommentid(rs.getInt(1));
                com.setComment(rs.getString(2));
                com.setChapter(findChapterbychapid(rs.getInt(3)));
                com.setAccount(fndAccountbyAccountid(rs.getInt("account")));
                com.setUser(rs.getString("username"));
                comments.add(com);
            }
            return comments;

        } catch (Exception e) {
            System.out.println("Loi khong lay duoc chapter");
        }
        return null;
    }

    public ArrayList<Comment> getCommentsByChapid(int chapid) {

        String sqlString = "select * from Comment where chapid = ? order by commentid desc";
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sqlString);
            stm.setInt(1, chapid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
//                Account account, String comment, int commentid, Chapter chapter, String user
                Comment com = new Comment(fndAccountbyAccountid(rs.getInt("account")), rs.getString("cmtcontent"), rs.getInt("commentid"), findChapterbychapid(rs.getInt("chapid")), rs.getString("username"));
                comments.add(com);
            }
            return comments;
        } catch (Exception e) {
            System.out.println("kjgong lay duoc comment by chapid");
        }
        return null;

    }

    public Chapter beginChapter(int cid) {

        try {
            String sql = "select top 1 * from chapter where cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Chapter chap = new Chapter();
                Comic c = findComicByCid(cid);
                chap.setComic(c);
                chap.setChapname(rs.getString("chapname"));
                chap.setView(rs.getInt("view"));
                chap.setPublicdate(rs.getDate("publicdate"));
                chap.setChapid(rs.getInt("chapid"));
                return chap;

            }

        } catch (Exception e) {
            System.out.println("loi lay 1 account");
        }
        return null;
    }

    public Chapter endChapter(int cid) {

        try {
            String sql = "select top 1 * from chapter where cid = ?  order by chapid desc ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Chapter chap = new Chapter();
                Comic c = findComicByCid(cid);
                chap.setComic(c);
                chap.setChapname(rs.getString("chapname"));
                chap.setView(rs.getInt("view"));
                chap.setPublicdate(rs.getDate("publicdate"));
                chap.setChapid(rs.getInt("chapid"));
                return chap;

            }

        } catch (Exception e) {
            System.out.println("loi lay 1 account");
        }
        return null;
    }

    public void updateViewChapter(int chapid, int view) {
        String sql = "update chapter set [view] = ? where chapid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, view);
            stm.setInt(2, chapid);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }


}
