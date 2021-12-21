<%@page contentType="text/html" import="java.sql.*,java.util.*;" pageEncoding="UTF-8"%>
<%
      
    try{
        if(request.getParameter("username").length()==0 || request.getParameter("email").length()==0 || request.getParameter("pass").length()==0 || 
                request.getParameter("gender").length()==0 || request.getParameter("dob").length()==0 || request.getParameter("caste").length()==0 || 
                request.getParameter("religion").length()==0 || request.getParameter("occupation").length()==0 || request.getParameter("state").length()==0 || request.getParameter("country").length()==0){
            response.sendRedirect("register.jsp?empty=1");
        }
        else{
                int sn = 0;
                String code = "";
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                String gender = request.getParameter("gender");
                String dob = request.getParameter("dob");
                String caste = request.getParameter("caste");
                String religion = request.getParameter("religion");
                String occupation = request.getParameter("occupation");
                String state = request.getParameter("state");
                String country = request.getParameter("country");
                LinkedList l = new LinkedList();
                for(char c='A' ; c<='Z' ; c++){
                    l.add(c+"");
                }
                for(char c='a' ; c<='z' ; c++){
                    l.add(c+"");
                }
                for(char c='0' ; c<='9' ; c++){
                    l.add(c+"");
                }
                Collections.shuffle(l);
                for(int i=0 ; i<6 ; i++){
                    code = code+l.get(i);
                }
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                    Statement st = cn.createStatement();
                    ResultSet rs = st.executeQuery("select MAX(sn) from user");
                    if(rs.next()){
                         sn = rs.getInt(1);   
                    }
                    sn = sn + 1 ;
                    code = code+"_"+sn;
                    
                    PreparedStatement ps = cn.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?,?,?)");
                    ps.setInt(1,sn);
                    ps.setString(2,code);
                    ps.setString(3,username);
                    ps.setString(4,email);
                    ps.setString(5,pass);
                    ps.setString(6,gender);
                    ps.setString(7,dob);
                    ps.setString(8,caste);
                    ps.setString(9,religion);
                    ps.setString(10,occupation);
                    ps.setString(11,state);
                    ps.setString(12,country);
                    if(ps.executeUpdate()>0){
                        response.sendRedirect("img_upload.jsp?code="+code+"&success=1");
                    }
                    else{
                       response.sendRedirect("register.jsp?again=1");
                    }
                    cn.close();
                    
                    //out.println(sn+" "+code+" "+username+" "+email+" "+pass+" "+gender+" "+dob+" "+caste+" "+religion+" "+occupation+" "+state+" "+country);
                
                    }
                catch(Exception ec){
                    out.println(ec.getMessage());
                } 
         } 
    }
    catch(NullPointerException e){
        response.sendRedirect("register.jsp");
        //out.println(e.getMessage());
    }

%>
