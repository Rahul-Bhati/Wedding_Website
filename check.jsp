<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        if(request.getParameter("email").length()==0 || request.getParameter("pass").length()==0){
            response.sendRedirect("login.jsp?empty=1");
        }
        else{
            try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                    Statement st = cn.createStatement();
                    ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
                    if(rs.next()){
                        if(pass.equals(rs.getString("pass"))){
                            Cookie c = new Cookie("user",email);
                            c.setMaxAge(3600);
                            response.addCookie(c);
                            response.sendRedirect("view_profile.jsp");
                        }
                        else{
                            response.sendRedirect("login.jsp?pass_invalid=1");
                        }
                    }
                    else{
                        response.sendRedirect("login.jsp?email_invalid=1");
                    }
                    cn.close();
               }
               catch(Exception ec){
                   out.println(ec.getMessage());
               } 
        }
%>
