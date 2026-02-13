<%@ page import="com.csd430.beans.MovieBean" %>
<%@ page import="java.util.*" %>


<%
    MovieBean bean = new MovieBean();

    String deleteId = request.getParameter("deleteId");
	if (deleteId != null) {
    int id = Integer.parseInt(deleteId);
    bean.deleteMovie(id);
	}
	String title = request.getParameter("title");
    if (title != null) {
        String genre = request.getParameter("genre");
        int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        String director = request.getParameter("director");

        bean.addMovie(title, genre, releaseYear, rating, director);
    }

    ArrayList<String[]> movies = bean.getAllMovies();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Records</title>

<style>
 body {
     font-family: "Georgia", serif;
     margin: 40px;
     background: linear-gradient(to bottom, #e8f5e9, #f1f8f4);
 }

 .container {
     max-width: 900px;
     background-color: #ffffff;
     border: 2px solid #4b6f44;
     padding: 30px;
     border-radius: 15px;
     box-shadow: 0 4px 12px rgba(0,0,0,0.1);
 }

 h2 {
     color: #2f4f2f;
 }

 p {
     color: #4a5e4a;
 }

 table {
     width: 100%;
     border-collapse: collapse;
     margin-top: 20px;
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

 tbody tr:nth-child(even) {
     background-color: #f3f9f3;
 }

 tbody tr:hover {
     background-color: #e1f0e1;
 }

 a {
     display: inline-block;
     margin-top: 20px;
     margin-right: 20px;
     color: #2e6b3e;
     font-weight: bold;
     text-decoration: none;
 }

 a:hover {
     text-decoration: underline;
 }
</style>

</head>

<body>
<div class="container">

<h2>Movie Database Records</h2>

<p>Below are all current records stored in the movie database.</p>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Release Year</th>
            <th>Rating</th>
            <th>Director</th>
			<th>Delete</th>
        </tr>
    </thead>
    <tbody>

    <% for (String[] movie : movies) { %>
        <tr>
            <td><%= movie[0] %></td>
            <td><%= movie[1] %></td>
            <td><%= movie[2] %></td>
            <td><%= movie[3] %></td>
            <td><%= movie[4] %></td>
            <td><%= movie[5] %></td>
			<td>
				<form method="post" style="display:inline;">
					<input type="hidden" name="deleteId" value="<%= movie[0] %>">
					<button type="submit">Delete</button>
				</form>
			</td>
        </tr>
    <% } %>

    </tbody>
</table>

<a href="movies.jsp">Add Another Movie</a>
<a href="index.jsp">Return to Home</a>

</div>
</body>
</html>



