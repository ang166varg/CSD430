<%-- Angela Vargas 4.2 Assignment CSD 430 01/26/2026 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Data Collection</title>
<style>
 body { font-family: Arial; margin: 25px; }
 .container { max-width: 750px; border: 1px solid #ccc; padding: 20px; border-radius: 10px; }
 label { font-weight: bold; display: block; margin-top: 12px; }
 input, textarea { width: 100%; padding: 8px; margin-top: 5px; }
 button { margin-top: 15px; padding: 10px 15px; }
</style>
</head>

<body>
<div class="container">

<h2>JavaBean Data Collection Form</h2>

<p><b>Angela Vargas 4.2 Assignment CSD 430 01/26/2026</b></p>

<p>
<b>Overall Description:</b>  
This form collects user data and sends it to a JSP page that stores the
values in a JavaBean and displays the results in an HTML table.
</p>

<form action="display.jsp" method="post">
  <label>First Name</label>
  <input type="text" name="firstName" required>

  <label>Last Name</label>
  <input type="text" name="lastName" required>

  <label>Email</label>
  <input type="email" name="email" required>

  <label>Phone Number</label>
  <input type="text" name="phone" required>

  <label>Favorite Team</label>
  <input type="text" name="favoriteTeam" required>

  <label>Comments</label>
  <textarea name="comments" rows="4"></textarea>

  <button type="submit">Submit Data</button>
</form>

</div>
</body>
</html>
