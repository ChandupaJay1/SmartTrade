package controller;

import com.google.gson.Gson;
import dto.Response_DTO;
import entity.Category;
import entity.Color;
import entity.Model;
import entity.Product_Condition;
import entity.Storage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.HibernateUtil;
import model.Validation;
import org.hibernate.Criteria;
import org.hibernate.Session;

@MultipartConfig
@WebServlet(name = "ProductListing", urlPatterns = {"/ProductListing"})
public class ProductListing extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Response_DTO response_DTO = new Response_DTO();
        Gson gson = new Gson();

        String category_id = request.getParameter("category_id");
        String model_id = request.getParameter("model_id");
        String storage_id = request.getParameter("storage_id");
        String color_id = request.getParameter("color_id");
        String condition_id = request.getParameter("condition_id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        
        Part image1 = request.getPart("image1");
        Part image2 = request.getPart("image2");
        Part image3 = request.getPart("image3");

        Session session = HibernateUtil.getSessionFactory().openSession();
        if (!Validation.isInteger(category_id)) {
            response_DTO.setContent("Invalid Category");

        } else if (!Validation.isInteger(model_id)) {
            response_DTO.setContent("Invalid Model");
        } else if (!Validation.isInteger(color_id)) {
            response_DTO.setContent("Invalid Color");
        } else if (!Validation.isInteger(storage_id)) {
            response_DTO.setContent("Invalid Storage");
        } else if (!Validation.isInteger(condition_id)) {
            response_DTO.setContent("Invalid Condition");
        } else if (title.isEmpty()) {
            response_DTO.setContent("Please fill Product Title.");
        } else if (description.isEmpty()) {
            response_DTO.setContent("Please fill Description.");
        } else if (price.isEmpty()) {
            response_DTO.setContent("Please fill Price.");
        } else if (!Validation.isDouble(price)) {
            response_DTO.setContent("Invalid Price.");
        } else if (Double.parseDouble(price) <= 0) {
            response_DTO.setContent("Invalid Price.");
        } else if (quantity.isEmpty()) {
            response_DTO.setContent("Please fill Quantity.");
        } else if (!Validation.isInteger(quantity)) {
            response_DTO.setContent("Invalid Quantity.");
        } else if (Integer.parseInt(quantity) <= 0) {
            response_DTO.setContent("Invalid Quantity.");
        } else if (image1.getSubmittedFileName() == null) {
            response_DTO.setContent("Please Enter Image 1");
        } else if (image2.getSubmittedFileName() == null) {
            response_DTO.setContent("Please Enter Image 2");
        } else if (image3.getSubmittedFileName() == null) {
            response_DTO.setContent("Please Enter Image 3");
        } else {
            Category category = (Category) session.get(Category.class, Integer.parseInt(category_id));
            if (category == null) {
                response_DTO.setContent("Please Select valid Category");
            } else {
                Model model = (Model) session.get(Model.class, Integer.parseInt(model_id));
                if (model == null) {
                    response_DTO.setContent("Please Select valid Model");
                } else {
                    if (model.getCategory().getId() != category.getId()) {
                        response_DTO.setContent("Select Valid Model");
                    } else {
                        Storage storage = (Storage) session.get(Storage.class, Integer.parseInt(storage_id));

                        if (storage == null) {
                            response_DTO.setContent("Please Select Valid Storage");
                        } else {
                            Color color = (Color) session.get(Color.class, Integer.parseInt(color_id));

                            if (color == null) {
                                response_DTO.setContent("Please Select Valid Color");
                            } else {
                                Product_Condition product_Condition = (Product_Condition) session.get(Product_Condition.class, Integer.parseInt(condition_id));

                                if (product_Condition == null) {
                                    response_DTO.setContent("Please Select valid Condition");
                                } else {

                                    
                                }

                            }
                        }

                    }
                }

            }

        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(response_DTO));
    }

}
