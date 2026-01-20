<%-- 
  Angela Vargas CSD430 3.2 Assignment
  File: displayApplication.jsp
--%>

<%
  request.setCharacterEncoding("UTF-8");

  String fullName = request.getParameter("fullName");
  String email = request.getParameter("email");
  String phone = request.getParameter("phone");
  String position = request.getParameter("position");
  String workType = request.getParameter("workType");
  String statement = request.getParameter("statement");

  String[] skillsArr = request.getParameterValues("skills");
  String skills = "None selected";

  if (skillsArr != null && skillsArr.length > 0) {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < skillsArr.length; i++) {
      sb.append(skillsArr[i]);
      if (i < skillsArr.length - 1) sb.append(", ");
    }
    skills = sb.toString();
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Application Summary</title>

  <style>
    body {
      font-family: "Bookman Old Style", Georgia, serif;
      background-color: #f4f1ec;
      padding: 40px;
    }

    .container {
      max-width: 950px;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 14px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    }

    .banner {
      background-color: #e7e0d8;
      border-left: 6px solid #7a6f5d;
      padding: 16px;
      border-radius: 10px;
      margin-bottom: 24px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      border: 1px solid #c7c0b6;
      padding: 14px;
      text-align: left;
    }

    th {
      background-color: #ded7cc;
      color: #4e4637;
      width: 30%;
    }

    a {
      display: inline-block;
      margin-top: 24px;
      text-decoration: none;
      color: #7a6f5d;
      font-weight: bold;
    }

    a:hover {
      text-decoration: underline;
    }

    h1 {
      color: #4e4637;
    }

    .small {
      color: #555;
      font-size: 0.95rem;
    }
  </style>
</head>

<body>
  <div class="container">

    <div class="banner">
      <strong>Angela Vargas CSD430 3.2 Assignment</strong>
      <p class="small">
        Overall data description: This table displays all user-submitted job application data
        in a clear and organized format.
      </p>
    </div>

    <h1>Submitted Application Data</h1>

    <table>
      <tr>
        <th>Field</th>
        <th>Value</th>
      </tr>
      <tr>
        <td>Full Name</td>
        <td><%= fullName %></td>
      </tr>
      <tr>
        <td>Email</td>
        <td><%= email %></td>
      </tr>
      <tr>
        <td>Phone Number</td>
        <td><%= phone %></td>
      </tr>
      <tr>
        <td>Position Applying For</td>
        <td><%= position %></td>
      </tr>
      <tr>
        <td>Work Type Preference</td>
        <td><%= workType %></td>
      </tr>
      <tr>
        <td>Skills</td>
        <td><%= skills %></td>
      </tr>
      <tr>
        <td>Short Statement</td>
        <td><%= statement %></td>
      </tr>
    </table>

    <a href="applicationForm.jsp">&#8592; Back to Job Application Form</a>

  </div>
</body>
</html>
