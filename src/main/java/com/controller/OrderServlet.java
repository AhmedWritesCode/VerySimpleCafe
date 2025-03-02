package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Customer;
import com.model.Order;

@WebServlet("/submitOrder")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get order form data
        int set1Quantity = Integer.parseInt(request.getParameter("set1Quantity"));
        int set2Quantity = Integer.parseInt(request.getParameter("set2Quantity"));
        String drink1 = request.getParameter("drink1");
        String drink2 = request.getParameter("drink2");

        // Retrieve customer data from session
        HttpSession session = request.getSession(false);
        Customer customer = (Customer) session.getAttribute("customer");

        // Create an Order object and set values
        Order order = new Order();
        order.setSet1Quantity(set1Quantity);
        order.setSet2Quantity(set2Quantity);
        order.setDrink1(drink1);
        order.setDrink2(drink2);

        // Calculate total price
        double totalPrice = order.calculateTotalPrice();

        // Apply discounts based on customer details
        double discount = 0;
        if (customer.getAge() >= 55) {
            discount = 0.05 * totalPrice; // 5% discount for senior citizens
        }
        if (request.getParameter("membership") != null) {
            discount = 0.10 * totalPrice; // 10% discount for gold members
        }
        double finalAmount = totalPrice - discount;

        // Store the order in the session
        session.setAttribute("order", order);
        session.setAttribute("finalAmount", finalAmount);

        // Optionally, store data in cookies (if desired)
        Cookie orderCookie = new Cookie("finalAmount", String.valueOf(finalAmount));
        response.addCookie(orderCookie);

        // Redirect to a summary page to show the final amount
        response.sendRedirect("CustomerPayment.jsp");
    }
}