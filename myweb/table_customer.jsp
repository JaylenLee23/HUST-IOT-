<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户表内容</title>
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
            margin-bottom: 10px;
            padding: 6px 12px;
            font-size: 14px;
            cursor: pointer;
            color: white;
            background-color: #337ab7;
            border: 1px solid #2e6da4;
            border-radius: 4px;
            text-decoration: none;
        }
    </style>
    <script>
        function restrictInput(event) {
            var keyCode = event.which || event.keyCode;
            // Allow only digits and remove non-digit characters
            if (!(/\d/).test(String.fromCharCode(keyCode))) {
                event.preventDefault();
            }
        }
    </script>
</head>
<body>
    <h2>客户表内容</h2>
    <a href="welcome.jsp" class="button">回到欢迎页面</a>

    <%
        String url = "jdbc:mysql://localhost:3306/website?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "password";
        String query = "SELECT cardID, customerName, telephoneNumber, isUse FROM customer";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {

                out.println("<table>");
                out.println("<tr>");
                out.println("<th>卡号</th>");
                out.println("<th>顾客姓名</th>");
                out.println("<th>电话号码</th>");
                out.println("<th>使用情况</th>");
                out.println("<th>更新电话号码</th>");
                out.println("</tr>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("cardID") + "</td>");
                    out.println("<td>" + rs.getString("customerName") + "</td>");
                    out.println("<td>" + rs.getString("telephoneNumber") + "</td>");
                    out.println("<td>" + rs.getString("isUse") + "</td>");
                    out.println("<td>");
                    out.println("<form action='updateCustomerPhone.jsp' method='post'>");
                    out.println("新电话号码: <input type='text' id='phone' name='newPhone' onkeypress='restrictInput(event)' requiredmaxlength='11'>");
                    out.println("<input type='hidden' name='cardID' value='" + rs.getString("cardID") + "'>");
                    out.println("<input type='submit' value='更新'>");
                    out.println("</form></td>");
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