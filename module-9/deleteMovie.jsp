<%@ page import="com.csd430.beans.MovieBean" %>
<%@ page import="java.util.*" %>

<%-- 
  Angela Vargas
  CSD430 - Project Part 4
  deleteMovie.jsp
  Purpose: Display all movie records, allow user to delete records using a dropdown of key fields (movie_id),
  then redisplay the remaining records and remaining keys.
--%>

<%
    MovieBean bean = new MovieBean();

    // If user submitted a delete request
    String deleteId = request.getParameter("deleteId");
    if (deleteId != null && !deleteId.trim().equals("")) {
        int id = Integer.parseInt(deleteId);
        bean.deleteMovie(id);
    }

    // Get updated data after delete (or initial load)
    ArrayList<String[]> movies = bean.getAllMovies();
    ArrayList<Integer> ids = bean.getMovieIDs();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Movie Records</title>

<style>
 body {
     font-family: "Georgia", serif;
     margin: 40px;
     background: linear-gradient(to bottom, #e8f5e9, #f1f8f4);
 }

 .container {
     max-width: 1000px;
     background-color: #ffffff;
     border: 2px solid #4b6f44;
     padding: 30px;
     border-radius: 15px;
     box-shadow: 0 4px 12px rgba(0,0,0,0.1);
 }

 h2 { color: #2f4f2f; margin-bottom: 5px; }
 .subtitle { color: #3d5c3d; font-weight: bold; margin-top: 0; }

 .description {
     color: #4a5e4a;
     line-height: 1.6;
     margin-bottom: 18px;
 }

 .form-box {
     background: #f3f9f3;
     border: 1px solid #7da67d;
     padding: 15px;
     border-radius: 12px;
     margin-top: 18px;
 }

 label {
     font-weight: bold;
     color: #2f4f2f;
     margin-right: 10px;
 }

 select {
     padding: 8px;
     border-radius: 8px;
     border: 1px solid #7da67d;
     min-width: 120px;
 }

 button {
     margin-left: 10px;
     padding: 9px 14px;
     border-radius: 10px;
     border: none;
     cursor: pointer;
     font-weight: bold;
     background: #b00020;
     color: white;
 }

 button:hover { background: #7a0016; }

 table {
     width: 100%;
     border-collapse: collapse;
     margin-top: 18px;
 }

 thead {
     background-color: #3a7d44;
     color: white;
 }

 th, td {
     padding: 10px;
     text-align: center;
     border: 1px solid #7da67d;
 }

 tbody tr:nth-child(even) { background-color: #f3f9f3; }
 tbody tr:hover { background-color: #e1f0e1; }

 .note {
     margin-top: 10px;
     color: #4a5e4a;
     font-style: italic;
 }

 a {
     display: inline-block;
     margin-top: 20px;
     margin-right: 18px;
     color: #2e6b3e;
     font-weight: bold;
     text-decoration: none;
 }

 a:hover { text-decoration: underline; }

 .status {
     margin-top: 12px;
     padding: 10px;
     border-radius: 10px;
     font-weight: bold;
 }

 .status.success {
     background: #e6f4ea;
     border: 1px solid #2e6b3e;
     color: #1b4332;
 }

 .status.info {
     background: #fff7e6;
     border: 1px solid #b38600;
     color: #5c4700;
 }

 .status.error {
     background: #fdecea;
     border: 1px solid #b00020;
     color: #7a0016;
 }
</style>
</head>

<body>
<div class="container">

<h2>Delete Movie Records</h2>
<p class="subtitle">Project Part 4: Delete Records Using Key Dropdown</p>

<p class="description">
This page displays all movie records in a table format. To delete a record, select a movie ID (the key field)
from the dropdown menu and submit the form. The page will refresh and show the remaining records and updated
key list. If all records are deleted, the table will remain visible with headers but no data rows.
</p>

<div class="form-box">
<form method="post" action="deleteMovie.jsp">
    <label for="deleteId">Select Movie ID to Delete:</label>

    <select name="deleteId" id="deleteId" <%= (ids.size() == 0 ? "disabled" : "") %>>
        <% if (ids.size() == 0) { %>
            <option value="">No IDs available</option>
        <% } else { %>
            <% for (Integer id : ids) { %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        <% } %>
    </select>

    <button type="submit" <%= (ids.size() == 0 ? "disabled" : "") %>>Delete Record</button>
</form>

<p class="note">
Key field used: <strong>movie_id</strong>. Remaining keys update automatically after each deletion.
</p>
</div>

<% if (deleteId != null && !deleteId.trim().equals("")) { %>
    <div class="status success">Delete request processed for movie_id = <%= deleteId %>.</div>
<% } %>

<% if (ids.size() == 0) { %>
    <div class="status info">All records have been deleted. The table headers remain visible as required.</div>
<% } %>

<table>
    <thead>
        <tr>
            <th>movie_id (INT PK)</th>
            <th>title (VARCHAR)</th>
            <th>genre (VARCHAR)</th>
            <th>release_year (INT)</th>
            <th>rating (DOUBLE)</th>
            <th>director (VARCHAR)</th>
        </tr>
    </thead>
    <tbody>
        <% if (movies == null || movies.size() == 0) { %>
            <%-- Keep tbody empty when no records exist (thead still shows) --%>
        <% } else { %>
            <% for (String[] movie : movies) { %>
                <tr>
                    <td><%= movie[0] %></td>
                    <td><%= movie[1] %></td>
                    <td><%= movie[2] %></td>
                    <td><%= movie[3] %></td>
                    <td><%= movie[4] %></td>
                    <td><%= movie[5] %></td>
                </tr>
            <% } %>
        <% } %>
    </tbody>
</table>

<a href="index.jsp">Return to Home</a>
<a href="displayMovie.jsp">View All Records</a>

</div>
</body>
</html>