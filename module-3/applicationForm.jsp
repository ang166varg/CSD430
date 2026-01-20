<%-- 
  Angela Vargas CSD430 3.2 Assignment
  File: applicationForm.jsp
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Job Application Form</title>
  <style>
    body{
      font-family: "Bookman Old Style", Georgia, serif;
      background:#f4f1ec;
      margin:0;
      padding:0;
    }
    .container{
      max-width:900px;
      margin:40px auto;
      background:#fff;
      padding:30px;
      border-radius:14px;
      box-shadow:0 8px 20px rgba(0,0,0,0.08);
    }
    .banner{
      background:#e7e0d8;
      border-left:6px solid #7a6f5d;
      padding:16px;
      border-radius:10px;
      margin-bottom:24px;
    }
    h1{ color:#4e4637; margin:0 0 10px 0; }
    .small{ color:#555; font-size:0.95rem; margin:6px 0 0 0; }
    label{
      display:block;
      margin-top:16px;
      font-weight:bold;
      color:#4e4637;
    }
    input, select, textarea{
      width:100%;
      padding:10px;
      margin-top:6px;
      border-radius:8px;
      border:1px solid #bdb6ad;
      font-family:"Bookman Old Style", Georgia, serif;
      font-size:1rem;
      background:#faf9f7;
      box-sizing:border-box;
    }
    fieldset{
      margin-top:18px;
      border:1px solid #bdb6ad;
      border-radius:10px;
      padding:14px;
    }
    legend{ font-weight:bold; color:#4e4637; }
    .inline{
      display:flex;
      flex-wrap:wrap;
      gap:16px;
      margin-top:10px;
    }
    .inline label{ font-weight:normal; margin-top:0; }
    .inline input{ width:auto; }
    button{
      margin-top:24px;
      background:#7a6f5d;
      color:#fff;
      border:none;
      padding:12px 18px;
      border-radius:10px;
      font-size:1rem;
      font-family:"Bookman Old Style", Georgia, serif;
      cursor:pointer;
    }
    button:hover{ background:#5e5548; }
  </style>
</head>

<body>
  <div class="container">
    <div class="banner">
      <strong>Angela Vargas CSD430 3.2 Assignment</strong>
      <p class="small">
        Overall description: This form gathers typical job application information including contact details,
        position interest, work preference, skills, and a short statement.
      </p>
    </div>

    <h1>Job Application Form</h1>
    <p class="small">Field description: Please complete all required fields accurately.</p>

    <form action="displayApplication.jsp" method="post">
      <label for="fullName">Full Name *</label>
      <input type="text" id="fullName" name="fullName" required>

      <label for="email">Email *</label>
      <input type="email" id="email" name="email" required>

      <label for="phone">Phone Number *</label>
      <input type="tel" id="phone" name="phone" required>

      <label for="position">Position Applying For *</label>
      <select id="position" name="position" required>
        <option value="">-- Select One --</option>
        <option>Yard Coordinator</option>
        <option>Operations Associate</option>
        <option>Software Intern</option>
        <option>Customer Service</option>
      </select>

      <fieldset>
        <legend>Work Type Preference *</legend>
        <div class="inline">
          <label><input type="radio" name="workType" value="Full-Time" required> Full-Time</label>
          <label><input type="radio" name="workType" value="Part-Time"> Part-Time</label>
          <label><input type="radio" name="workType" value="Seasonal"> Seasonal</label>
        </div>
      </fieldset>

      <fieldset>
        <legend>Skills (Select all that apply)</legend>
        <div class="inline">
          <label><input type="checkbox" name="skills" value="Communication"> Communication</label>
          <label><input type="checkbox" name="skills" value="Teamwork"> Teamwork</label>
          <label><input type="checkbox" name="skills" value="Problem Solving"> Problem Solving</label>
          <label><input type="checkbox" name="skills" value="Java"> Java</label>
          <label><input type="checkbox" name="skills" value="SQL"> SQL</label>
        </div>
      </fieldset>

      <label for="statement">Short Statement *</label>
      <textarea id="statement" name="statement" rows="4" required></textarea>

      <button type="submit">Submit Application</button>
    </form>
  </div>
</body>
</html>
