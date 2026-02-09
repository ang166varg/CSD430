<%@ page import="com.csd430.beans.MovieBean" %>

<%
    String selected = request.getParameter("movie_id");
    out.println("Selected ID: " + selected);

    int id = Integer.parseInt(selected);

    MovieBean bean = new MovieBean();
    bean.getMovieByID(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Record Details</title>
</head>
<body>

<h2>Movie Record Details</h2>
<p>Displaying record from angela_movies_data table</p>

<table border="1">
    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Release Year</th>
            <th>Rating</th>
            <th>Director</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%= bean.getMovie_id() %></td>
            <td><%= bean.getTitle() %></td>
            <td><%= bean.getGenre() %></td>
            <td><%= bean.getRelease_year() %></td>
            <td><%= bean.getRating() %></td>
            <td><%= bean.getDirector() %></td>
        </tr>
    </tbody>
</table>

<br><br>
<a href="movies.jsp">Return to Selection</a>

</body>
</html>


