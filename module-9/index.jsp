<%-- 
Angela Vargas 
CSD 430 
Module 9.2 – Project Part 4
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Database Application</title>

<style>
 body {
     font-family: "Georgia", serif;
     margin: 40px;
     background: linear-gradient(to bottom, #e8f5e9, #f1f8f4);
 }

 .container {
     max-width: 750px;
     background-color: #ffffff;
     border: 2px solid #4b6f44;
     padding: 30px;
     border-radius: 15px;
     box-shadow: 0 4px 12px rgba(0,0,0,0.1);
 }

 h2 {
     color: #2f4f2f;
     font-size: 28px;
 }

 .subtitle {
     color: #3d5c3d;
     font-weight: bold;
     margin-bottom: 15px;
 }

 .description {
     color: #4a5e4a;
     line-height: 1.6;
 }

 a {
     display: block;
     margin-top: 18px;
     font-size: 18px;
     text-decoration: none;
     color: #2e6b3e;
     font-weight: bold;
     transition: 0.3s;
 }

 a:hover {
     color: #1b4332;
     text-decoration: underline;
 }
</style>

</head>

<body>
<div class="container">

<h2>Movie Database System</h2>

<p class="subtitle">
Project Part 4: Delete Movie Records(JavaBean + JSP)
</p>

<p class="description">
This application allows users to add new movie records, view all stored records,
and update existing records. All database operations are handled through a JavaBean.
</p>

<a href="movies.jsp">Add a New Movie Record</a>
<a href="displayMovie.jsp">View All Movie Records</a>
<a href="selectMovie.jsp">Update a Movie Record</a>
<a href="deleteMovie.jsp">Delete Movie Records</a>

</div>
</body>
</html>
