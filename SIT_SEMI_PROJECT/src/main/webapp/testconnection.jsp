<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <title>JSP JDBC Example</title>
</head>
<body>
	<script>
		alert("test");
	</script>
    <h2>JSP JDBC Example</h2>

    <% 
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 데이터베이스 연결
//             String jdbcUrl = "jdbc:mysql://10.0.3.34:3306/sit_semi_project";
            String jdbcUrl = "jdbc:mysql://192.168.0.73:3306/sit_semi_project";
            String user = "SIT";
            String password = "sit_12#$";
            connection = DriverManager.getConnection(jdbcUrl, user, password);

            // SQL 쿼리 작성
            String sql = "SELECT * FROM test_table";
            statement = connection.createStatement();

            // 쿼리 실행
            resultSet = statement.executeQuery(sql);

            // 결과 출력
            out.println("<table border='1'>");
            out.println("<tr><th>Column1</th><th>Column2</th></tr>");

            while (resultSet.next()) {
                String column1 = resultSet.getString("no");
                String column2 = resultSet.getString("content");

                out.println("<tr><td>" + column1 + "</td><td>" + column2 + "</td></tr>");
            }

            out.println("</table>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 정리
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
