<%-- 
    Document   : changepass
    Created on : 16 Nov, 2021, 8:21:21 AM
    Author     : hp
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    
        String email = null;
        Cookie c[] = request.getCookies();
        for(int i=0;i<c.length;i++){
            if(c[i].getName().equals("user")){
                email = c[i].getValue();
                break;
            }
        }
        if(email==null){
            response.sendRedirect("index.jsp");
        }
        else{
            if(request.getParameter("cp").length()!=0 || request.getParameter("np").length()!=0 || request.getParameter("rp").length()!=0){
                String cp = request.getParameter("cp");
                String np = request.getParameter("np");
                String rp = request.getParameter("rp");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                    Statement st = cn.createStatement();
                    ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
                    if(rs.next()){
                        if(rs.getString("pass").equals(cp)){
                            if(np.equals(rp)){
                                PreparedStatement ps = cn.prepareStatement("update user set pass=? where email=?");
                                ps.setString(1, np);
                                ps.setString(2, email);
                                if(ps.executeUpdate()>0){
                                   response.sendRedirect("change_pass.jsp?success=1");
                                }
                                else{
                                    response.sendRedirect("change_pass.jsp?again=1");
                                }
                            }
                            else{
                                response.sendRedirect("change_pass.jsp?miss_match=1");
                            }
                        }
                        else{
                            response.sendRedirect("change_pass.jsp?invalid_pass=1");
                        }
                    }
                    
                 }
                 catch(Exception e){
                    out.println(e.getMessage());
                 }
            }
            else{
                response.sendRedirect("change_pass.jsp?empty=1");
            }
        }
%>

