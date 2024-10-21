<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销表</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .back-button {
            display: inline-block;
            margin-top: 10px;
            padding: 6px 12px;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            background-color: #337ab7;
            border: 1px solid #2e6da4;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h2>注销表</h2>
    <a href="welcome.jsp" class="button">回到欢迎页面</a>

    <%
        String url = "jdbc:mysql://localhost:3306/website?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "password";
        String query = "SELECT cardId, time, remark FROM writeoff";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {

                out.println("<table>");
                out.println("<tr>");
                out.println("<th>卡号</th>");
                out.println("<th>时间</th>");
                out.println("<th>记录</th>");
                out.println("</tr>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("cardId") + "</td>");
                    out.println("<td>" + rs.getString("time") + "</td>");
                    out.println("<td>" + rs.getString("remark") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>