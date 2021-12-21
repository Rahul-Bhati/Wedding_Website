<%-- 
    Document   : story_upload
    Created on : 17 Nov, 2021, 11:05:05 AM
    Author     : hp
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*;" pageEncoding="UTF-8"%>
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
            if(request.getParameter("couplename").length()==0 || request.getParameter("story").length()==0){
                response.sendRedirect("story.jsp?empty=1");
            }
            else{
                int sn = 0;
                String code = "";
                String couplename = request.getParameter("couplename");
                String story = request.getParameter("story");
                LinkedList l = new LinkedList();
                for(char ch='A' ; ch<='Z' ; ch++){
                    l.add(ch+"");
                }
                for(char ch='a' ; ch<='z' ; ch++){
                    l.add(ch+"");
                }
                for(char ch='0' ; ch<='9' ; ch++){
                    l.add(ch+"");
                }
                Collections.shuffle(l);
                for(int i=0 ; i<6 ; i++){
                    code = code+l.get(i);
                }
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                    Statement st = cn.createStatement();
                    ResultSet rs = st.executeQuery("select MAX(sn) from story");
                    if(rs.next()){
                         sn = rs.getInt(1);   
                    }
                    sn = sn + 1 ;
                    code = code+"_"+sn;
                    
                    PreparedStatement ps = cn.prepareStatement("insert into story values(?,?,?,?,?)");
                    ps.setInt(1,sn);
                    ps.setString(2,code);
                    ps.setString(3,couplename);
                    ps.setString(4,story);
                    ps.setString(5,email);
                   
                    if(ps.executeUpdate()>0){
                        response.sendRedirect("img_story.jsp?code="+code+"&success=1");
                    }
                    else{
                       response.sendRedirect("story.jsp?again=1");
                    }
                    cn.close();
                    
                    //out.println(sn+" "+code+" "+username+" "+email+" "+pass+" "+gender+" "+dob+" "+caste+" "+religion+" "+occupation+" "+state+" "+country);
                
                 }
                 catch(Exception e){
                    out.println(e.getMessage());
                 }
            }
        }
%>

