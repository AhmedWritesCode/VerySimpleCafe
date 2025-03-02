<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Order" %>
<%@ page import="com.model.Customer" %>
<%

    Customer customer = (Customer) session.getAttribute("customer");
    Order order = (Order) session.getAttribute("order");
    String paymentMethod = (String) session.getAttribute("paymentMethod");
    Double finalAmount = (Double) session.getAttribute("finalAmount");

    // Redirect if any necessary data is missing
    if (customer == null || order == null || paymentMethod == null || finalAmount == null) {
        response.sendRedirect("CustomerDetail.jsp");
        return;
    }

    // Calculate discounts (assuming they were applied previously, you may adjust this based on the exact setup)
    double originalTotal = order.calculateTotalPrice();
    double discount = originalTotal - finalAmount;
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Invoice</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .invoice-container {
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #008080;
            background-color: #f8f9fa;
            width: 80%;
        }
        .invoice-header {
            text-align: center;
            color: #008080;
            margin-bottom: 20px;
        }
        .invoice-table {
            width: 100%;
            border-collapse: collapse;
        }
        .invoice-table th, .invoice-table td {
            border: 1px solid #505050;
            padding: 8px;
            text-align: center;
        }
        .invoice-summary {
            margin-top: 20px;
        }
        .btn {
            margin-top: 20px;
            background-color: #008080;
            color: white;
            border-radius: 30px;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="invoice-container">
        <div class="invoice-header">
            <h2>MyCafe Invoice</h2>
        </div>

        <!-- Customer Information -->
        <div>
            <p><strong>Customer Name:</strong> <%= customer.getFullName() %></p>
            <p><strong>Age:</strong> <%= customer.getAge() %></p>
            <p><strong>Shipping Address:</strong> <%= customer.getAddress() %></p>
        </div>

        <!-- Order Summary Table -->
        <table class="invoice-table">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Drink</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Set 1</td>
                    <td><%= order.getSet1Quantity() %></td>
                    <td><%= order.getDrink1() %></td>
                    <td>
                        <% 
                            double set1Price = 0;
                            if (order.getDrink1().equals("coffee")) {
                                set1Price = order.getSet1Quantity() * 10.00;
                            } else if (order.getDrink1().equals("milo")) {
                                set1Price = order.getSet1Quantity() * 13.00;
                            }
                        %>
                        $<%= String.format("%.2f", set1Price) %>
                    </td>
                </tr>
                <tr>
                    <td>Set 2</td>
                    <td><%= order.getSet2Quantity() %></td>
                    <td><%= order.getDrink2() %></td>
                    <td>
                        <% 
                            double set2Price = 0;
                            if (order.getDrink2().equals("coffee")) {
                                set2Price = order.getSet2Quantity() * 11.00;
                            } else if (order.getDrink2().equals("milo")) {
                                set2Price = order.getSet2Quantity() * 15.00;
                            } else if (order.getDrink2().equals("lemon tea")) {
                                set2Price = order.getSet2Quantity() * 12.00;
                            }
                        %>
                        $<%= String.format("%.2f", set2Price) %>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Payment Summary -->
        <div class="invoice-summary">
            <p><strong>Original Total:</strong> $<%= String.format("%.2f", originalTotal) %></p>
            <p><strong>Discount Applied:</strong> $<%= String.format("%.2f", discount) %></p>
            <p><strong>Final Amount:</strong> $<%= String.format("%.2f", finalAmount) %></p>
            <p><strong>Payment Method:</strong> <%= paymentMethod %></p>
        </div>

        <!-- Optional: Back to Home or Other Page -->
        <form action="CustomerDetail.jsp" method="get">
            <button class="btn">Back to Home</button>
        </form>
    </div>
</body>

</html>
