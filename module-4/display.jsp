

<%
    // Angela Vargas 4.2 Assignment CSD 430 01/26/2026

    com.csd430.beans.UserDataBean user =
        new com.csd430.beans.UserDataBean();

    user.setFirstName(request.getParameter("firstName"));
    user.setLastName(request.getParameter("lastName"));
    user.setEmail(request.getParameter("email"));
    user.setPhone(request.getParameter("phone"));
    user.setFavoriteTeam(request.getParameter("favoriteTeam"));
    user.setComments(request.getParameter("comments"));
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Data Display</title>
<style>
 body { font-family: Arial; margin: 25px; }
 table { border-collapse: collapse; width: 70%; }
 th, td { border: 1px solid #333; padding: 10px; text-align: left; }
 th { background-color: #f2f2f2; }
</style>
</head>

<body>

<h2>Submitted Data (JavaBean)</h2>
<p><b>Angela Vargas 4.2 Assignment CSD 430 01/26/2026</b></p>

<p>
<b>Field Description:</b>  
The table below displays the values collected from the form and stored in
a JavaBean object using JSP scriptlets.
</p>

<table>
<tr><th>Field</th><th>Value</th></tr>
<tr><td>First Name</td><td><%= user.getFirstName() %></td></tr>
<tr><td>Last Name</td><td><%= user.getLastName() %></td></tr>
<tr><td>Email</td><td><%= user.getEmail() %></td></tr>
<tr><td>Phone</td><td><%= user.getPhone() %></td></tr>
<tr><td>Favorite Team</td><td><%= user.getFavoriteTeam() %></td></tr>
<tr><td>Comments</td><td><%= user.getComments() %></td></tr>
</table>

<br>
<a href="index.jsp">Return back to Form</a>

</body>
</html>
