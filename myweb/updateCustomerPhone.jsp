<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新用户电话</title>
</head>
<body>
    <%
        String url = "jdbc:mysql://localhost:3306/website?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "password";
        String cardID = request.getParameter("cardID");
        String newPhone = request.getParameter("newPhone");

        String updateQuery = "UPDATE customer SET telephoneNumber = ? WHERE cardID = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
                pstmt.setString(1, newPhone);
                pstmt.setString(2, cardID);
                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    out.println("<p>电话更新成功</p>");
                } else {
                    out.println("<p>电话更新失败</p>");
                }
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
    <a href="table_customer.jsp">回到用户表</a>
</body>
</html>