<%@ page import="com.csd430.beans.MovieBean" %>
<%@ page import="java.util.*" %>

<%
    MovieBean bean = new MovieBean();
    ArrayList<Integer> ids = bean.getMovieIDs();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Movie to Update</title>

<style>
 body { font-family:"Georgia",serif; margin:40px; background:linear-gradient(to bottom,#e8f5e9,#f1f8f4); }
 .container { max-width:750px; background:#fff; border:2px solid #4b6f44; padding:30px; border-radius:15px; box-shadow:0 4px 12px rgba(0,0,0,0.1); }
 h2 { color:#2f4f2f; }
 p { color:#4a5e4a; }
 label { font-weight:bold; display:block; margin-top:15px; color:#3d5c3d; }
 select { width:100%; padding:10px; margin-top:6px; border-radius:8px; border:1px solid #7da67d; }
 button { margin-top:20px; padding:10px 18px; background:#3a7d44; color:white; border:none; border-radius:10px; cursor:pointer; font-size:16px; transition:0.3s; }
 button:hover { background:#2d5d34; }
 a { display:block; margin-top:20px; color:#2e6b3e; font-weight:bold; text-decoration:none; }
 a:hover { text-decoration:underline; }
</style>
</head>

<body>
<div class="container">

<h2>Select a Movie Record to Update</h2>
<p>Choose a Movie ID (key field) from the dropdown list.</p>

<form action="editMovie.jsp" method="post">
    <label for="movieId">Movie ID</label>
    <select name="movieId" id="movieId" required>
        <option value="">-- Select an ID --</option>
        <% for (int id : ids) { %>
            <option value="<%= id %>"><%= id %></option>
        <% } %>
    </select>

    <button type="submit">Load Record</button>
</form>

<a href="index.jsp">Return to Home</a>

</div>
</body>
</html>