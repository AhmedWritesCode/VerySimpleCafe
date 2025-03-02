<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Order" %>
<%@ page import="com.model.Customer" %>
<%
    Order order = (Order) session.getAttribute("order");
    Customer customer = (Customer) session.getAttribute("customer");
    Double finalAmount = (Double) session.getAttribute("finalAmount");

    // If the session or required objects are missing, redirect to a previous page
    if (order == null || customer == null || finalAmount == null) {
        response.sendRedirect("CustomerDetail.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<!-- AHMED ZAKI AL-GABALY : A22EC4003 -->

<head>
<meta charset="ISO-8859-1">
    <title>Cust Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>

		.tbl{
			width: 100%;
			color:#f8f9fa;
			font-weight: 600;
			background-color: #505050;
			border: 1px solid #008080;
			margin-top: 1.5em;
			margin-bottom: 1em;
		}

        .btn{
            transition: all .5s ease;
            width: 50%;
            border-radius: 30px;
            color:#008080;
            font-weight: 600;
            background-color: #fff;
            border: 1px solid #008080;
            margin-top: 1.5em;
            margin-bottom: 1em;
        }
        .btn:hover, .btn:focus{
            background-color: #008080;
            color:#fff;
        }
        </style>
    </head>

<body>
    <div class="container-fluid">
        <h3>MyCafe</h3>
        <h5>Payment</h5>
        
                <!-- Display order details -->
        <table class="table tbl">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Drink</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Set 1</td>
                    <td><%= order.getSet1Quantity() %></td>
                    <td><%= order.getDrink1() %></td>
                </tr>
                <tr>
                    <td>Set 2</td>
                    <td><%= order.getSet2Quantity() %></td>
                    <td><%= order.getDrink2() %></td>
                </tr>
            </tbody>
        </table>
        
               <!-- Display final payment amount -->
        <h5>Total Amount to Pay: $<%= String.format("%.2f", finalAmount) %></h5>
        
           <!-- Payment Method Selection -->
          
                <form method="post" action="ProcessPaymentServlet">
            <div class="col-lg-5">
                <h4>please complete this section </h4><br><br><br><br><br>

				
				<div class="form-group>">
                <label for="payment">Payment Method : </label>
                
                    <select required name="payment">
                        <option value="" disabled selected>Select your payment method...</option>
                        <option value="online banking">Online Banking</option>
                        <option value="card">Credit/Debit Card</option>
                        <option value="e-wallet">E-Wallet</option>
                    </select>
                
                <br><br>
            </div>
            <input class="btn" type="submit" value="confirm payment" name="orderBtn" />

        </form>
    </div>
</body>

</html>