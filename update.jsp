<%@page contentType="text/html" import="java.sql.*,java.util.*;" pageEncoding="UTF-8"%>

<%
    try{
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
            if(request.getParameter("username").length()==0 ||  request.getParameter("gender").length()==0 || request.getParameter("dob").length()==0 || request.getParameter("caste").length()==0 || 
                request.getParameter("religion").length()==0 || request.getParameter("occupation").length()==0 || request.getParameter("state").length()==0 || request.getParameter("country").length()==0){
                    response.sendRedirect("edit_profile.jsp?empty=1");
            }
            else{
                String username = request.getParameter("username");
                String gender = request.getParameter("gender");
                String dob = request.getParameter("dob");
                String caste = request.getParameter("caste");
                String religion = request.getParameter("religion");
                String occupation = request.getParameter("occupation");
                String state = request.getParameter("state");
                String country = request.getParameter("country");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                    PreparedStatement ps = cn.prepareStatement("update user set username=?,gender=?,dob=?,caste=?,religion=?,occupation=?,state=?,country=? where email=?");
                    ps.setString(1, username);
                    ps.setString(2, gender);
                    ps.setString(3, dob);
                    ps.setString(4, caste);
                    ps.setString(5, religion);
                    ps.setString(6, occupation);
                    ps.setString(7, state);
                    ps.setString(8, country);
                    ps.setString(9, email);
                    if(ps.executeUpdate()>0){
                       response.sendRedirect("edit_profile.jsp?success=1");
                    }
                    else{
                        response.sendRedirect("edit_profile.jsp?again=1");
                    }
                 }
                 catch(Exception e){
                    out.println(e.getMessage());
                 }
            }
        }
    }
    catch(NullPointerException e){
        response.sendRedirect("edit_profile.jsp");
       //  out.println(e.getMessage());
    }

%>
