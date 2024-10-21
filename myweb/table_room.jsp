<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间信息表</title>

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
    <h2>房间信息表</h2>
    <a href="welcome.jsp" class="button">回到欢迎页面</a>
    <%
        String url = "jdbc:mysql://localhost:3306/website?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "password";
        String queryRoom = "SELECT * FROM room";
        String queryCard = "SELECT * FROM card WHERE isUse = '未退房'";
        String queryPrice = "SELECT SUM(r.price) AS totalPrice FROM room r INNER JOIN card c ON r.roomId = c.roomId WHERE c.isUse = '未退房'";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 Statement stmt = conn.createStatement()) {

                // Query room table
                try (ResultSet rs = stmt.executeQuery(queryRoom)) {
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<th>房间号</th>");
                    out.println("<th>面积/m*2</th>");
                    out.println("<th>房间类型</th>");
                    out.println("<th>房价￥/天</th>");
                    out.println("</tr>");

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("roomId") + "</td>");
                        out.println("<td>" + rs.getDouble("square") + "</td>");
                        out.println("<td>" + rs.getString("roomType") + "</td>");
                        out.println("<td>" + rs.getString("price") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                }

                // Query card table to count records
                int x = 0;
                try (ResultSet rs2 = stmt.executeQuery(queryCard)) {
                    while (rs2.next()) {
                        x++;
                    }
                }

                out.println("<p>房间利用率: " + x * 10 + "%</p>");


                    try (ResultSet rs3 = stmt.executeQuery(queryPrice)) {
                                     if (rs3.next()) {
                                           double totalPrice = rs3.getDouble("totalPrice");
                                           out.println("<p>当天总房价: " + totalPrice + "￥" + "</p>");
                                       }
                            }
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>