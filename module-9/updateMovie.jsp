<%@ page import="com.csd430.beans.MovieBean" %>

<%
    int movieId = Integer.parseInt(request.getParameter("movieId"));
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
    double rating = Double.parseDouble(request.getParameter("rating"));
    String director = request.getParameter("director");

    MovieBean bean = new MovieBean();
    boolean updated = bean.updateMovie(movieId, title, genre, releaseYear, rating, director);

    String[] movie = bean.getMovieById(movieId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Result</title>

<style>
 body { font-family:"Georgia",serif; margin:40px; background:linear-gradient(to bottom,#e8f5e9,#f1f8f4); }
 .container { max-width:900px; background:#fff; border:2px solid #4b6f44; padding:30px; border-radius:15px; box-shadow:0 4px 12px rgba(0,0,0,0.1); }
 h2 { color:#2f4f2f; }
 .status { padding:12px; border-radius:10px; font-weight:bold; margin:15px 0; }
 .success { background:#e6f4ea; border:1px solid #2e6b3e; color:#1b4332; }
 .fail { background:#fdecea; border:1px solid #b00020; color:#7a0016; }

 table { width:100%; border-collapse:collapse; margin-top:20px; }
 thead { background:#3a7d44; color:white; }
 th, td { padding:10px; text-align:center; border:1px solid #7da67d; }
 tbody tr:nth-child(even) { background:#f3f9f3; }

 a { display:inline-block; margin-top:20px; margin-right:20px; color:#2e6b3e; font-weight:bold; text-decoration:none; }
 a:hover { text-decoration:underline; }
</style>
</head>

<body>
<div class="container">

<h2>Updated Movie Record</h2>

<% if (updated) { %>
    <div class="status success">Update Successful </div>
<% } else { %>
    <div class="status fail">Update Failed (Check logs / ID exists / DB connection)</div>
<% } %>

<table>
    <thead>
        <tr>
            <th>Field Name</th>
            <th>Field Type</th>
            <th>Value</th>
        </tr>
    </thead>
    <tbody>
        <tr><td>movie_id</td><td>INT (PK)</td><td><%= movie[0] %></td></tr>
        <tr><td>title</td><td>VARCHAR</td><td><%= movie[1] %></td></tr>
        <tr><td>genre</td><td>VARCHAR</td><td><%= movie[2] %></td></tr>
        <tr><td>release_year</td><td>INT</td><td><%= movie[3] %></td></tr>
        <tr><td>rating</td><td>DOUBLE</td><td><%= movie[4] %></td></tr>
        <tr><td>director</td><td>VARCHAR</td><td><%= movie[5] %></td></tr>
    </tbody>
</table>

<a href="selectMovie.jsp">Update Another Movie</a>
<a href="displayMovie.jsp">View All Movies</a>
<a href="index.jsp">Return to Home</a>

</div>
</body>
</html>