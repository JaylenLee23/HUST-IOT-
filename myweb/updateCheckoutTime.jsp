<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新退房时间</title>
</head>
<body>
    <%
        String url = "jdbc:mysql://localhost:3306/website?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "password";
        String number = request.getParameter("number");
        String newCheckoutTime = request.getParameter("newCheckoutTime");

        String updateQuery = "UPDATE card SET checkOutTime = ? WHERE number = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
                pstmt.setString(1, newCheckoutTime);
                pstmt.setString(2, number);
                int affectedRows = pstmt.executeUpdate();
                if (affectedRows > 0) {
                    out.println("<p>退房时间更新成功</p>");
                } else {
                    out.println("<p>更新退房时间失败</p>");
                }
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
    <a href="table_card.jsp">回到注册信息表</a>
</body>
</html>