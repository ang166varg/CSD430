<%@ page import="com.csd430.beans.MovieBean" %>

<%
    int movieId = Integer.parseInt(request.getParameter("movieId"));
    MovieBean bean = new MovieBean();
    String[] movie = bean.getMovieById(movieId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Movie</title>

<style>
 body { font-family:"Georgia",serif; margin:40px; background:linear-gradient(to bottom,#e8f5e9,#f1f8f4); }
 .container { max-width:750px; background:#fff; border:2px solid #4b6f44; padding:30px; border-radius:15px; box-shadow:0 4px 12px rgba(0,0,0,0.1); }
 h2 { color:#2f4f2f; font-size:26px; }
 p { color:#4a5e4a; }
 label { font-weight:bold; display:block; margin-top:15px; color:#3d5c3d; }
 input { width:100%; padding:8px; margin-top:5px; border-radius:8px; border:1px solid #7da67d; }
 .readonlyBox { margin-top:5px; padding:10px; border-radius:8px; border:1px dashed #7da67d; background:#f3f9f3; font-weight:bold; color:#2f4f2f; }
 button { margin-top:20px; padding:10px 18px; background:#3a7d44; color:white; border:none; border-radius:10px; cursor:pointer; font-size:16px; transition:0.3s; }
 button:hover { background:#2d5d34; }
 a { display:block; margin-top:20px; color:#2e6b3e; font-weight:bold; text-decoration:none; }
 a:hover { text-decoration:underline; }
</style>
</head>

<body>
<div class="container">

<h2>Update Movie Record</h2>
<p>The Movie ID is the key field and cannot be updated. Update the other fields below.</p>

<form action="updateMovie.jsp" method="post">
    <input type="hidden" name="movieId" value="<%= movie[0] %>">

    <label>Movie ID (Not Editable)</label>
    <div class="readonlyBox"><%= movie[0] %></div>

    <label>Title</label>
    <input type="text" name="title" value="<%= movie[1] %>" required>

    <label>Genre</label>
    <input type="text" name="genre" value="<%= movie[2] %>" required>

    <label>Release Year</label>
    <input type="number" name="releaseYear" value="<%= movie[3] %>" required>

    <label>Rating</label>
    <input type="number" step="0.1" name="rating" value="<%= movie[4] %>" required>

    <label>Director</label>
    <input type="text" name="director" value="<%= movie[5] %>" required>

    <button type="submit">Save Updates</button>
</form>

<a href="selectMovie.jsp">Select Another Movie</a>
<a href="index.jsp">Return to Home</a>

</div>
</body>
</html>