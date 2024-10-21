<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册表内容</title>
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
    </style>
</head>
<body>
    <h2>注册表内容</h2>
    <a href="welcome.jsp" class="button">回到欢迎页面</a>
    <h3>添加新纪录</h3>
    <form action="addCard.jsp" method="post">
        序号: <input type="text" name="number" required><br>
        卡号: <input type="text" name="cardId" required><br>
        房间号: <input type="text" name="roomId" required><br>
        入住时间: <input type="text" name="checkInTime" required><br>
        退房时间: <input type="text" name="checkOutTime" required><br>
        使用情况: <input type="text" name="isUse" required><br>
        <input type="submit" value="新增">
    </form>
    <%
        String url = "jdbc:mysql://localhost:3306/website?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "password";
        String query = "SELECT number, cardId, roomId, checkInTime, checkOutTime, isUse FROM card";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(query)) {

                out.println("<table>");
                out.println("<tr>");
                out.println("<th>序号</th>");
                out.println("<th>卡号</th>");
                out.println("<th>房间号</th>");
                out.println("<th>入住时间</th>");
                out.println("<th>退房时间</th>");
                out.println("<th>使用情况</th>");
                out.println("<th>更新退房时间");
                out.println("</tr>");

                while (rs.next()) {
                    String number = rs.getString("number");
                    String cardId = rs.getString("cardId");
                    String roomId = rs.getString("roomId");
                    String checkInTime = rs.getString("checkInTime");
                    String checkOutTime = rs.getString("checkOutTime");
                    String isUse = rs.getString("isUse");

                    out.println("<tr>");
                    out.println("<td>" + number + "</td>");
                    out.println("<td>" + cardId + "</td>");
                    out.println("<td>" + roomId + "</td>");
                    out.println("<td>" + checkInTime + "</td>");
                    out.println("<td>" + checkOutTime + "</td>");
                    out.println("<td>" + isUse + "</td>");
                    out.println("<td><form action='updateCheckoutTime.jsp' method='post'>");
                    out.println("新的退房时间: <input type='text' name='newCheckoutTime' required>");
                    out.println("<input type='hidden' name='number' value='" + number + "'>");
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