package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Customer;

@WebServlet("/submitDetails")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String fullName = request.getParameter("fullname");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");

        // Create a customer object and set the values
        Customer customer = new Customer();
        customer.setFullName(fullName);
        customer.setAge(age);
        customer.setAddress(address);

        // Store the customer object in the session
        HttpSession session = request.getSession();
        session.setAttribute("customer", customer);

        // Redirect to another page (example: a confirmation or order page)
        response.sendRedirect("CustomerOrder.jsp");  // Change "order.jsp" to your target page
    }
}