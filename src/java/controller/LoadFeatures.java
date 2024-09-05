package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.Response_DTO;
import entity.Product_Condition;
import entity.Category;
import entity.Color;
import entity.Model;
import entity.Storage;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

/**
 *
 * @author chand
 */
@WebServlet(name = "LoadFeatures", urlPatterns = {"/LoadFeatures"})
public class LoadFeatures extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("ok");

        Response_DTO response_DTO = new Response_DTO();

        Gson gson = new Gson();

//           SELECT * FROM category
        Session session = HibernateUtil.getSessionFactory().openSession();

        Criteria criteria1 = session.createCriteria(Category.class);
        criteria1.addOrder(Order.asc("name"));
        List<Category> categoryList = criteria1.list();

//           SELECT * FROM model
        Criteria criteria2 = session.createCriteria(Model.class);
        criteria2.addOrder(Order.asc("name"));
        List<Model> modelList = criteria2.list();

//           SELECT * FROM color
        Criteria criteria3 = session.createCriteria(Color.class);
        criteria3.addOrder(Order.asc("name"));
        List<Color> colorlList = criteria3.list();

//           SELECT * FROM Storage
        Criteria criteria4 = session.createCriteria(Storage.class);
        criteria4.addOrder(Order.asc("value"));
        List<Storage> storageList = criteria4.list();

//           SELECT * FROM condition
        Criteria criteria5 = session.createCriteria(Product_Condition.class);
        criteria5.addOrder(Order.asc("name"));
        List<Product_Condition> conditionList = criteria5.list();

        JsonObject json0bject = new JsonObject();
        json0bject.add("categoryList", gson.toJsonTree(categoryList));
        json0bject.add("modelList", gson.toJsonTree(modelList));
        json0bject.add("colorlList", gson.toJsonTree(colorlList));
        json0bject.add("storageList", gson.toJsonTree(storageList));
        json0bject.add("conditionList", gson.toJsonTree(conditionList));

        resp.setContentType("application/json");
        resp.getWriter().write(gson.toJson(json0bject));

        session.close();

    }
}
