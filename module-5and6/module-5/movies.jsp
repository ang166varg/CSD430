<%@ page import="java.util.ArrayList" %>
<%@ page import="com.csd430.beans.MovieBean" %>

<%
    MovieBean bean = new MovieBean();
    ArrayList<Integer> movieList = bean.getMovieIDs();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Selection</title>
</head>
<body>

<h2>Select Movie</h2>

<form action="displayMovie.jsp" method="post">
    <select name="movie_id">
        <% for (Integer id : movieList) { %>
            <option value="<%= id %>"><%= id %></option>
        <% } %>
    </select>
    <br><br>
    <input type="submit" value="Submit">
</form>

</body>
</html>
<%
out.println("Movie count: " + movieList.size());
%>




