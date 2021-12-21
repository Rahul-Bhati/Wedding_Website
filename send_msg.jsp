<%-- 
    Document   : send_msg
    Created on : 16 Nov, 2021, 10:15:34 AM
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
                if(request.getParameter("code")!=null){
                    String to_code = request.getParameter("code");
                    if(request.getParameter("msg").length()==0){
                        response.sendRedirect("msg.jsp?empty=1&code="+to_code);
                    }
                    else{
                        String msg = request.getParameter("msg") ;
                        String from_email = email;
                        String to_email = "";
                        String from_code = "";
                        try{
                            int sn = 0;
                            String code = "";
                            LinkedList l = new LinkedList();
                            for(char ch='A' ; ch<='Z' ; ch++){
                                l.add(ch+"");
                            }
                            for(char ch='a' ; ch<='z' ; ch++){
                                l.add(ch+"");
                            }
                            for(char ch='0'; ch<='9';ch++){
                                l.add(ch+"");
                            }
                            Collections.shuffle(l);
                            for(int i=0 ; i<6 ; i++){
                                code = code+l.get(i);
                            }
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wedding","root","");
                            Statement st = cn.createStatement();
                            ResultSet rs = st.executeQuery("select email from user where code='"+to_code+"'");
                            if(rs.next()){
                                to_email = rs.getString(1);
                            }
                            Statement st1 = cn.createStatement();
                            ResultSet rs1 = st.executeQuery("select code from user where email='"+from_email+"'");
                            if(rs1.next()){
                                from_code = rs1.getString(1);
                            }
                            Statement st2 = cn.createStatement();
                            ResultSet rs2 = st.executeQuery("select MAX(sn) from inbox");
                            if(rs2.next()){
                                 sn = rs2.getInt(1);   
                            }
                            sn = sn + 1 ;
                            code = code+"_"+sn;
                           
                            //out.println(from_email+" "+from_code+" "+to_email+" "+to_code+" "+sn+" "+code+" "+msg);
                            PreparedStatement ps = cn.prepareStatement("insert into inbox values(?,?,?,?,?,?,?)");
                            ps.setInt(1,sn);
                            ps.setString(2,code);
                            ps.setString(3,from_email);
                            ps.setString(4,from_code);
                            ps.setString(5,to_email);
                            ps.setString(6,to_code);
                            ps.setString(7,msg);
                            
                            if(ps.executeUpdate()>0){
                                response.sendRedirect("msg.jsp?success=1&code="+to_code);
                            }
                            else{
                               response.sendRedirect("msg.jsp?again=1&code="+to_code);
                            }
                            cn.close();
                        }
                        catch(Exception e){
                            out.println(e.getMessage());
                        }
                    }
                }
                else{
                    response.sendRedirect("view_profile?code_error=1.jsp");
                }
            }
%>