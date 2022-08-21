<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    if(request.getParameter("uname")!=null) 
    {
        String email=request.getParameter("ajex_email"); 
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrsystem","root","root");
           
            PreparedStatement pstmt=null;
            
            pstmt=con.prepareStatement("SELECT * FROM user WHERE email=? ");
            pstmt.setString(1,email); 
            ResultSet rs=pstmt.executeQuery();
            
            if(rs.next())               
            {  
                %>
                <script>
                    alert("Sorry this username is not available")
                            window.location.replace("join.jsp");

                </script>
                <%
                
            }
            else
            {
                %>
                <span class="text-success">email is available</span>
                <%
                
            }

            con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
%>