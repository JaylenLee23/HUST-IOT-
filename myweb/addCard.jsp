<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加记录</title>
</head>
<body>
    <%
        String url = "jdbc:mysql://localhost:3306/website?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "password";
        String number = request.getParameter("number");
        String cardId = request.getParameter("cardId");
        String roomId = request.getParameter("roomId");
        String checkInTime = request.getParameter("checkInTime");
        String checkOutTime = request.getParameter("checkOutTime");
        String isUse = request.getParameter("isUse");

        String insertQuery = "INSERT INTO card (number, cardId, roomId, checkInTime, checkOutTime, isUse) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
                pstmt.setString(1, number);
                pstmt.setString(2, cardId);
                pstmt.setString(3, roomId);
                pstmt.setString(4, checkInTime);
                pstmt.setString(5, checkOutTime);
                pstmt.setString(6, isUse);
                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    out.println("<p>记录添加成功</p>");
                } else {
                    out.println("<p>记录添加失败</p>");
                }
            }
        } catch (Exception e) {
            out.println("<p>错误: " + e.getMessage() + "</p>");
        }
    %>
    <a href="table_card.jsp">回到注册信息表</a>
</body>
</html>