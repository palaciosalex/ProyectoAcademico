<%-- 
    Document   : DatosCurso
    Created on : 26/07/2020, 05:13:37 PM
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilosmenu.css" rel="stylesheet" type="text/css"/>
        <title>Datos Curso</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idcurso;
            String s_nombre;
            String s_creditos, s_horas;
            String s_codigo;
            String s_estado;
        %>
    </head>
    <body>
        <header>
            <h1>REGISTRO DE CURSO</h1>
        </header>
        <% 
            
            try {
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idcurso = request.getParameter("f_idcurso");
                if (s_accion!=null && s_accion.equals("M1")) {
                    consulta =  "   select nombre, creditos, horas, codigo, estado  "
                                + " from curso "
                                + " where  "
                                + " idcurso =  " + s_idcurso;
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                              
                    %>    
                <form name="EditarCursoForm" action="DatosCurso.jsp" method="GET">
                    <table border="0" align="center" class="mar" style="margin: auto; display: table" >
                        <thead>
                            <tr>
                                <th colspan="2">Editar Curso</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Nombre:</td>
                                <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="25" /></td>
                            </tr>
                            <tr>
                                <td>Creditos:</td>
                                <td><input type="text" name="f_creditos" value="<% out.print(rs.getString(2)); %>" maxlength="40" size="25"/></td>
                            </tr>
                            <tr>
                                <td>Horas: </td>
                                <td><input type="text" name="f_horas" value="<% out.print(rs.getString(3)); %>" maxlength="8" size="8" /></td>
                            </tr>
                            <tr>
                                <td>Código: </td>
                                <td><input type="text" name="f_codigo" value="<% out.print(rs.getString(4)); %>" maxlength="12" size="15" /></td>
                            </tr>
                            <tr>
                                <td>Estado: </td>
                                <td><input type="text" name="f_estado" value="<% out.print(rs.getString(5)); %>" maxlength="1" size="2" /></td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <input type="submit" value="Editar" name="f_editar" />
                                    <input type="hidden" name="f_accion" value="M2" />
                                    <input type="hidden" name="f_idcurso" value="<%out.print(s_idcurso);%>" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>

                    <%
                        }
                }else{

        %>
        <form name="AgregarCurso" action="DatosCurso.jsp" method="GET">
            <table border="0" align="center" class="mar" style="margin: auto; display: table">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Curso</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="25" /></td>
                    </tr>
                    <tr>
                        <td>Creditos:</td>
                        <td><input type="text" name="f_creditos" value="" maxlength="40" size="25"/></td>
                    </tr>
                    <tr>
                        <td>Horas: </td>
                        <td><input type="text" name="f_horas" value=""maxlength="8" size="8" /></td>
                    </tr>
                    <tr>
                        <td>Código: </td>
                        <td><input type="text" name="f_codigo" value="" maxlength="12" size="15" /></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                            
                        
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
            }
                
                %>
                    <table border="0" cellpadding ="2" align = "center" class="mar" style="margin: auto; display: table" >
                        <thead>
                            <tr>
                                <th colspan="8">
                                    Datos Curso
                                </th>
                            </tr>
                            <tr>
                                <th>ide</th>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Horas</th>
                                <th>Creditos</th>
                                <th>Estado</th>
                                <th colspan="2">Acciones</th>

                            </tr>
                        </thead>
                        
                            
                    <%
                         if (s_accion !=null) {
                    
                    if (s_accion.equals("E")) {
                            consulta =    " delete from curso "
                                        + " where  "
                                        + " idcurso = " + s_idcurso +"; ";
                           
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    
                    }else if(s_accion.equals("C")){
                            s_nombre = request.getParameter("f_nombre");
                            s_creditos = request.getParameter("f_creditos");
                            s_horas = request.getParameter("f_horas");
                            s_codigo = request.getParameter("f_codigo");
                            s_estado = request.getParameter("f_estado");
                            
                            consulta =    " insert into "
                                        + " curso (nombre, creditos, horas, codigo, estado)"
                                        + " values('"+ s_nombre +"','"+ s_creditos +"','"+ s_horas +"','"+ s_codigo +"','"+s_estado+"');  ";
                            
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    
                    }else if (s_accion.equals("M2")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_creditos = request.getParameter("f_creditos");
                            s_horas = request.getParameter("f_horas");
                            s_codigo = request.getParameter("f_codigo");
                            s_estado = request.getParameter("f_estado");
                            consulta =  "   update curso "
                                        + " set  "
                                        + " nombre = '"+ s_nombre +"', "
                                        + " creditos = '" + s_creditos + "', "
                                        + " horas = '" + s_horas + "', "
                                        + " codigo = '" + s_codigo + "', "
                                        + " estado = '" + s_estado + "'  "
                                        + " where  "
                                        + " idcurso = " + s_idcurso + "; ";
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    }
                    
                }
                consulta= " Select idcurso, codigo, nombre, horas, creditos, estado "
                + " from curso ";
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {
                    
                    num++;
                    ide = rs.getString(1);
                    %>
                            <tr>
                                <td><%out.print(num);%></td>
                                <td><%out.print(rs.getString(2));%></td>
                                <td><%out.print(rs.getString(3));%></td>
                                <td><%out.print(rs.getString(4));%></td>
                                <td><%out.print(rs.getString(5));%></td>
                                <td><%out.print(rs.getString(6));%></td>
                                <td>
                                    <a href="DatosCurso.jsp?f_accion=M1&f_idcurso=<%out.print(ide);%>">
                                        <img src="img/062-pencil.png" width="20" height="20" alt="062-pencil"/>
                                    </a>
                                </td>
                                <td>
                                    <a href="DatosCurso.jsp?f_accion=E&f_idcurso=<%out.print(ide);%>">
                                        <img src="img/019-close.png" width="20" height="20" alt="019-close"/>
                                    </a>
                                </td>
                                
                            </tr>                    
                    <%
                       
                    }
                    
                    rs.close();
                    pst.close();
                    cn.close();
            } catch (Exception e) {
            }
        %>
                            <tr align="center" align="center">
                                <td colspan="8">
                                    <form name="EnviarMenú" action="menu.jsp" method="POST">
                                        <input type="submit" value="Menú" name="EnviarMenú" />
                                    </form>
                                </td>
                            </tr>
                    </table>
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>   </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>    </td>
                                    </tr>
                                    <tr>
                                        <td>    </td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                    </tr>
                                                                        <tr>
                                        <td>   </td>
                                    </tr>
                                                                        <tr>
                                        <td>   </td>
                                    </tr>
                                </tbody>
                            </table>
    </body>
    <footer>
        <p>Diseñado y desarrollado por el grupo Programación ATS - UNTELS</p>
    </footer>
    </body>
</html>
