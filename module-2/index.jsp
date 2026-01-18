<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // ============================================================
    // Angela Vargas
    // CSD430 2.2 Assignment
    // Dynamic JSP page using Scriptlets + HTML table + external CSS
    // Topic: Books I have enjoyed reading
    // ============================================================

    // Record format: Title, Author, Genre, Year, Rating (1-5)
    String[][] books = {
        {"The Hobbit", "J.R.R. Tolkien", "Fantasy", "1937", "5"},
        {"The Shining", "Stephen King", "Horror", "1977", "5"},
        {"Pet Sematary", "Stephen King", "Horror", "1983", "4"},
        {"The Body", "Stephen King", "Drama", "1982", "4"},
        {"The Portrait of Dorian Gray", "Oscar Wilde", "Classic", "1890", "5"},
        {"The Handmaid's Tale", "Margaret Atwood", "Dystopian", "1985", "4"}
    };

    // Group records by genre (topical categories)
    Map<String, List<String[]>> groupedByGenre = new LinkedHashMap<String, List<String[]>>();
    for (int i = 0; i < books.length; i++) {
        String genre = books[i][2];

        if (!groupedByGenre.containsKey(genre)) {
            groupedByGenre.put(genre, new ArrayList<String[]>());
        }
        groupedByGenre.get(genre).add(books[i]);
    }

    // Field descriptions (used for display)
    String[] fieldNames = {"Title", "Author", "Genre", "Year", "Rating"};
    String[] fieldDescriptions = {
        "Name of the book",
        "Person who wrote the book",
        "Topical category used to group records",
        "Original publication year",
        "Personal rating from 1 (lowest) to 5 (highest)"
    };
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Favorite Books - JSP Scriptlet Table</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <header class="header">
        <h1>Favorite Books I Enjoyed Reading</h1>
        <p class="course-tag">Angela Vargas • CSD430 • 2.2 Assignment</p>
    </header>

    <section class="card">
        <h2>Overall Data Description</h2>
        <p>
            This dynamic JSP page displays a small dataset of books I enjoyed reading.
            The records are grouped into topical categories by <strong>Genre</strong>.
            All Java logic is contained inside JSP Scriptlets, and all HTML tags are outside the scriptlets.
        </p>
        <p class="note">
            Requirements met: scriptlets, external CSS, HTML table, 5+ records, 3+ fields, grouped categories, and documented code.
        </p>
    </section>

    <section class="card">
        <h2>Field Descriptions</h2>

        <table class="info-table">
            <thead>
                <tr>
                    <th>Field</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Output field descriptions as HTML table rows
                    for (int i = 0; i < fieldNames.length; i++) {
                %>
                <tr>
                    <td><%= fieldNames[i] %></td>
                    <td><%= fieldDescriptions[i] %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </section>

    <section class="card">
        <h2>Book Records Grouped by Genre</h2>

        <%
            // Loop through each genre group and print a table per category
            for (Map.Entry<String, List<String[]>> entry : groupedByGenre.entrySet()) {
                String genre = entry.getKey();
                List<String[]> genreBooks = entry.getValue();
        %>

        <h3 class="genre-title">Genre: <%= genre %></h3>

        <table class="data-table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Year</th>
                    <th>Rating</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Output each record as a table row
                    for (int i = 0; i < genreBooks.size(); i++) {
                        String[] record = genreBooks.get(i);
                %>
                <tr>
                    <td><%= record[0] %></td>
                    <td><%= record[1] %></td>
                    <td><%= record[3] %></td>
                    <td><%= record[4] %> / 5</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            } // end genre loop
        %>
    </section>

    <footer class="footer">
        <p>Dynamic JSP Table Example • Scriptlets + External CSS</p>
    </footer>
</body>
</html>
