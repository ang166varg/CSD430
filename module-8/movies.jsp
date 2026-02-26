<%@ page import="com.csd430.beans.MovieBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Movie</title>

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
     font-size: 26px;
 }

 p {
     color: #4a5e4a;
 }

 label {
     font-weight: bold;
     display: block;
     margin-top: 15px;
     color: #3d5c3d;
 }

 input {
     width: 100%;
     padding: 8px;
     margin-top: 5px;
     border-radius: 8px;
     border: 1px solid #7da67d;
 }

 button {
     margin-top: 20px;
     padding: 10px 18px;
     background-color: #3a7d44;
     color: white;
     border: none;
     border-radius: 10px;
     cursor: pointer;
     font-size: 16px;
     transition: 0.3s;
 }

 button:hover {
     background-color: #2d5d34;
 }

 a {
     display: block;
     margin-top: 20px;
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

<h2>Add a New Movie Record</h2>

<p>Please complete the form below to insert a new movie into the database.</p>

<form action="displayMovie.jsp" method="post">

    <label>Title</label>
    <input type="text" name="title" required>

    <label>Genre</label>
    <input type="text" name="genre" required>

    <label>Release Year</label>
    <input type="number" name="releaseYear" required>

    <label>Rating</label>
    <input type="number" step="0.1" name="rating" required>

    <label>Director</label>
    <input type="text" name="director" required>

    <button type="submit">Add Movie</button>

</form>

<a href="index.jsp">Return to Home</a>

</div>

</body>
</html>






