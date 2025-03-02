package com.controller;  // Adjust according to your package structure

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Customer;
import com.model.Order;

@WebServlet("/ProcessPaymentServlet")  // URL mapping for this servlet
public class ProcessPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve payment method from request
        String paymentMethod = request.getParameter("payment");
        
        // Assuming that order details are already processed and final amount is calculated
        // You need to retrieve the order and customer details from the session if not done already
        HttpSession session = request.getSession(false); // Get existing session
        
        if (session == null) {
            response.sendRedirect("CustomerDetail.jsp"); // Redirect if no session exists
            return;
        }

        // Retrieve the customer and order objects from the session
        Customer customer = (Customer) session.getAttribute("customer");
        Order order = (Order) session.getAttribute("order");
        Double finalAmount = (Double) session.getAttribute("finalAmount"); // Assuming you have stored this before

        // Check if all necessary data is available
        if (customer == null || order == null || finalAmount == null) {
            response.sendRedirect("CustomerDetail.jsp");
            return; // Exit if no necessary information is available
        }

        // Store the payment method in the session for later use
        session.setAttribute("paymentMethod", paymentMethod);

        // Redirect to the invoice page
        response.sendRedirect("CustomerInovice.jsp");
    }
}
