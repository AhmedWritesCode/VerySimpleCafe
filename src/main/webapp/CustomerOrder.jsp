<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Customer" %>
<%@ page import="com.model.Order" %>
    
    <%

    // Check if session exists
    if (session == null) {
        // Redirect to CustomerDetail.jsp if session is null
        response.sendRedirect("CustomerDetail.jsp");
        return; // Exit the JSP if no session is available
    }

    // Retrieve the customer object from session
    Customer customer = (Customer) session.getAttribute("customer");
    
    // Check if customer data is available
    if (customer == null) {
        response.sendRedirect("CustomerDetail.jsp");
        return; // Exit if no customer information is available
    }
%>
<!DOCTYPE html>
<html>
<!-- AHMED ZAKI AL-GABALY : A22EC4003 -->

<head>
  <title>Customer Order</title>
<meta charset="ISO-8859-1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        width: 30%;
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
  <div class="container">
    <form action="submitOrder" method="post">
      <h3>MyCafe</h3>
      <h5>Complete Your Order</h5>

      <table class="table table-dark tbl">
        <tr>
          <td> <img src="images/hashbrown.jpg" width="356" height="263" alt="hashbrown" /> </td>
          <td> <img src="images/hotcakes.jpg" width="356" height="263" alt="hotcakes" /></td>
        </tr>

        <tr>
          <div class="checkbox"></div>
          <td><input name="hashbrownChkbox" type="checkbox" value="hashbrown" checked> Set 1: Hashbrown with drink</td>
          <td><input name="hotcakesChkbox" type="checkbox" value="hotcakes" checked> Set 2: Hot Pancakes with drink</td>
  </div>
  </tr>

  <tr>
    <td>Select Drink:
      <select required name="drink1">
        <option value="" disabled selected>Select drink...</option>
        <option value="coffee">coffee</option>
        <option value="milo">milo</option>
      </select>
    </td>
    <td>Select Drink:
      <select required name="drink2">
        <option value="" disabled selected>Select drink...</option>
        <option value="coffee">coffee</option>
        <option value="milo">milo</option>
        <option value="lemon tea">lemon tea</option>
      </select>
    </td>
  </tr>

  <tr>
    <div class="form-control"> <!-- Task 1, Validation -->>
              <td>Quantity: <input type="number" name="set1Quantity" value="0" size="5" min="0" max="20" required /></td>
              <td>Quantity: <input type="number" name="set2Quantity" value="0" size="5" min="0" max="20" required /></td>
    </div>
  </tr>

  <tr>
    <td>
      <div style="text-align: left;">Price/Set (Set 1 with) : <br>
        Coffee : $10.00 <br>
        Milo : $13.00 <br>
    </td>
    <td>
      <div style="text-align: left;">Price/Set (Set 2 with) : <br>
        Coffee : $11.00 <br>
        Milo : $15.00 <br>
        Lemon Tea : $12.00 <br>
    </td>
  </tr>
  </table>

  <input class="btn" type="submit" value="Order" name="orderBtn" />
  <input class="btn" type="reset" value="Reset" name="resetBtn" />
  <br>
  </form>
  </div>
</body>

</html>