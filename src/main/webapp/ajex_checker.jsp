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
            Connection con=DriverManager.getConnection("jdbc:postgresql://ec2-52-49-120-150.eu-west-1.compute.amazonaws.com:5432/dbt2n4ufb35tt9","buctxcvhzkynmq","ed63df97e3ed14918e622f6cfa76f9b0715a543608324085b8cb3dff6742d7dd");
           
            PreparedStatement pstmt=null;
            
            pstmt=con.prepareStatement("SELECT * FROM usertable WHERE email=? ");
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