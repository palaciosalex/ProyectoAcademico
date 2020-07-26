<%-- 
    Document   : matricula
    Created on : 23/07/2020, 10:02:19 PM
    Author     : Alex
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Matricula</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilosmenu.css" rel="stylesheet" type="text/css"/>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst,pst2;
            ResultSet rs,rs2;
            String s_accion;
            String s_idmatricula;
            String s_semestre;
            String s_ciclo;
            String s_estado;
            String s_idestudiante;
            String s_idcurso;
            String s_idcarrera;
        %>
    </head>
    <body>
        <header>
            <h1>REGISTRO DE MATRICULAS</h1>
        </header>
        <% 
            try {
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idmatricula = request.getParameter("f_idmatricula");
                // Primera parte del modificar
                if (s_accion!=null && s_accion.equals("M1")) {
                    consulta =  "   select E.codigo,M.idestudiante,M.idcarrera,M.ciclo,M.semestre,M.idcurso,M.estado  "
                                + " from matricula M,estudiante E  "
                                + " where M.idestudiante=E.idestudiante and"
                                + " M.idmatricula=" + s_idmatricula;
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {     
                    %>    
                <form name="EditarMatriculaForm" action="DatosMatricula.jsp" method="GET">
                    <table border="0" align="center"class="mar" style="margin: auto; display: table">
                        <thead>
                            <tr>
                                <th colspan="2">Editar Matricula</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Codigo estudiante:</td>
                                <td><input type="text" name="f_codigoestudiante" value="<%out.print(rs.getString(1));%>" maxlength="12" size="12" /></td>
                            </tr>
                            <tr>
                                <td>Carrera: </td>
                                <td>
                                    <select name="f_idcarrera">
                            <%  
                                consulta= "Select * from carrera";
                                pst2 = cn.prepareStatement(consulta);
                                rs2 = pst2.executeQuery();

                                while(rs2.next()){
                                    if(rs2.getString(1).equals(rs.getString(3))){
                                        out.print("<option value='"+rs2.getString(1)+"' selected>"+rs2.getString(3)+"</option>"); 
                                    }else{
                                        out.print("<option value='"+rs2.getString(1)+"'>"+rs2.getString(3)+"</option>"); 
                                    }
                                }
                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Ciclo: </td>
                                <td><input type="text" name="f_ciclo" value="<%out.print(rs.getString(4));%>" maxlength="2" size="1" /></td>
                            </tr>
                            <tr>
                                <td>Semestre: </td>
                                <td><input type="text" name="f_semestre" value="<%out.print(rs.getString(5));%>"maxlength="10" size="10" /></td>
                            </tr>
                            <tr>
                                <td>Curso: </td>
                                <td>
                                    <select name="f_idcurso">
                            <%
                                consulta= " Select * from curso";
                                pst2 = cn.prepareStatement(consulta);
                                rs2 = pst2.executeQuery();

                                while(rs2.next()){
                                    if(rs2.getString(1).equals(rs.getString(6))){
                                        out.print("<option value='"+rs2.getString(1)+"' selected>"+rs2.getString(3)+"</option>"); 
                                    }else{
                                        out.print("<option value='"+rs2.getString(1)+"'>"+rs2.getString(3)+"</option>"); 
                                    }
                                }
                            %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Estado: </td>
                                <td><input type="text" name="f_estado" value="<%out.print(rs.getString(7));%>" maxlength="1" size="2" /></td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <input type="submit" value="Editar" name="f_editar" />
                                    <input type="hidden" name="f_accion" value="M2" />
                                    <input type="hidden" name="f_idmatricula" value="<%out.print(s_idmatricula);%>" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                 
                    
                    <%
                    }
                }else{
        %>
        <form name="AgregarMatriculaForm" action="DatosMatricula.jsp" method="GET">
            <table border="0" align="center" class="mar" style="margin: auto; display: table">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Matricula</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Codigo estudiante:</td>
                        <td><input type="text" name="f_codigoestudiante" value="" maxlength="12" size="12" /></td>
                    </tr>
                    <tr>
                        <td>Carrera: </td>
                        <td>
                            <select name="f_idcarrera">
                    <%
                        consulta= " Select * from carrera";
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        while(rs.next()){
     
                            out.print("<option value='"+rs.getString(1)+"'>"+rs.getString(3)+"</option>");                     
                        }
                    %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Ciclo: </td>
                        <td><input type="text" name="f_ciclo" value="" maxlength="2" size="1" /></td>
                    </tr>
                    <tr>
                        <td>Semestre: </td>
                        <td><input type="text" name="f_semestre" value=""maxlength="10" size="10" /></td>
                    </tr>
                    <tr>
                        <td>Curso: </td>
                        <td>
                            <select name="f_idcurso">
                    <%
                        consulta= " Select * from curso";
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        
                        while(rs.next()){
                            out.print("<option value='"+rs.getString(1)+"'>"+rs.getString(3)+"</option>");                     
                        }
                    %>
                            </select>
                        </td>
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
                    <table border="1" cellpadding ="2" align = "center" class="mar" style="margin: auto; display: table" >
                        <thead>
                            <tr>
                                <th colspan="9">
                                    Datos Matriculas
                                </th>
                            </tr>
                            <tr>
                                <th>#</th>
                                <th>Estudiante</th>
                                <th>Carrera</th>
                                <th>Ciclo</th>
                                <th>Semestre</th>
                                <th>Curso</th>
                                <th>Estado</th>
                                <th colspan="2">Acciones</th>
                            </tr>
                        </thead>    
                    <%
                if (s_accion !=null) {
                    
                    // Ejecutar la eliminación de estudiantes
                    if (s_accion.equals("E")) {
                            consulta =    " delete from matricula "
                                        + " where  "
                                        + " idmatricula = " + s_idmatricula +"; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                    // Sino se elimina registros de estudiantes, 
                    // Pregunta si se va a REGISTRAR UN NUEVO ESTUDIANTE
                    }else if(s_accion.equals("C")){
                            
                            String codigoestudiante=request.getParameter("f_codigoestudiante");
                            
                            consulta="select idestudiante from estudiante "
                                    + "where codigo='"+codigoestudiante+"'";
                            pst = cn.prepareStatement(consulta);
                            rs = pst.executeQuery();
                            while(rs.next()){
                                s_idestudiante=rs.getString(1);
                            }
                            if(rs.last()){
                                
                                s_idcarrera = request.getParameter("f_idcarrera");
                                s_ciclo = request.getParameter("f_ciclo");
                                s_semestre = request.getParameter("f_semestre");
                                s_idcurso = request.getParameter("f_idcurso");
                                s_estado = request.getParameter("f_estado");
                            
                                consulta = " insert into "
                                           + " matricula (idestudiante, idcarrera, ciclo, semestre, idcurso, estado)"
                                           + " values("+ s_idestudiante +","+ s_idcarrera +",'"+ s_ciclo +"','"
                                           + s_semestre +"',"+s_idcurso+",'"+s_estado+"')";
                                pst = cn.prepareStatement(consulta);
                                pst.executeUpdate();
                            }else{
                                out.print("<p align=center>El codigo ingresado no existe</p>");
                            }     
                    // Si no se está creando o eliminando registro de estudiante
                    // Pregunta si va a hacer la MODIFICACIÓN DE ESTUDIANTES - Parte 2
                    }else if (s_accion.equals("M2")) {
                        
                            String codigoestudiante=request.getParameter("f_codigoestudiante");
                            
                            consulta="select idestudiante from estudiante "
                                    + "where codigo='"+codigoestudiante+"'";
                            pst = cn.prepareStatement(consulta);
                            rs = pst.executeQuery();
                            while(rs.next()){
                                s_idestudiante=rs.getString(1);
                            }
                            
                            if(rs.last()){
                                
                                s_idcarrera = request.getParameter("f_idcarrera");
                                s_ciclo = request.getParameter("f_ciclo");
                                s_semestre = request.getParameter("f_semestre");
                                s_idcurso = request.getParameter("f_idcurso");
                                s_estado = request.getParameter("f_estado");
                                s_idmatricula = request.getParameter("f_idmatricula");
                                
                                consulta =  " update matricula  "
                                        + " set  "
                                        + " idestudiante = '"+ s_idestudiante +"', "
                                        + " idcarrera = '" + s_idcarrera + "', "
                                        + " ciclo = '" + s_ciclo + "', "
                                        + " semestre = '" + s_semestre + "', "
                                        + " idcurso = '" + s_idcurso + "', "
                                        + " estado = '" + s_estado + "'  "
                                        + " where  "
                                        + " idmatricula = " + s_idmatricula + "; ";
                                //out.print(consulta);
                                pst = cn.prepareStatement(consulta);
                                pst.executeUpdate();
                            }else{
                                out.print("<p align=center>El codigo ingresado no existe</p>");
                            } 
                    }
                }
                consulta= "select E.idestudiante,E.nombre,CA.idcarrera,CA.nombre,"
                        + "M.ciclo,M.semestre,C.idcurso,C.nombre,M.estado,M.idmatricula "
                        + "from estudiante E,carrera CA,curso C,matricula M "
                        + "where M.idestudiante=E.idestudiante and "
                        + "M.idcarrera=CA.idcarrera and "
                        + "M.idcurso=C.idcurso";
        
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String idestudiante,idcarrera,idcurso,idmatricula;
                while (rs.next()) {
                    num++;
                    idmatricula = rs.getString(10);
                    idestudiante = rs.getString(1);
                    idcarrera = rs.getString(3);
                    idcurso = rs.getString(7);
                    %>
                            <tr>
                                <td><%out.print(num);%></td>
                                <td><%out.print(rs.getString(2));%></td>
                                <td><%out.print(rs.getString(4));%></td>
                                <td><%out.print(rs.getString(5));%></td>
                                <td><%out.print(rs.getString(6));%></td>
                                <td><%out.print(rs.getString(8));%></td>
                                <td><%out.print(rs.getString(9));%></td>
                                <td>
                                    <a href="DatosMatricula.jsp?f_accion=M1&f_idmatricula=<%out.print(idmatricula);%>">
                                        <img src="img/062-pencil.png" width="20" height="20" alt="062-pencil"/>
                                    </a>
                                </td>
                                <td>
                                    <a href="DatosMatricula.jsp?f_accion=E&f_idmatricula=<%out.print(idmatricula);%>">
                                        <img src="img/019-close.png" width="20" height="20" alt="019-close"/>                                         
                                    </a>
                                </td>
                                
                            </tr>
                    <% 
                    }
                    // Se cierra todas las conexiones
                    rs.close();
                    pst.close();
                    cn.close();
            } catch (Exception e) {
            }
        %>
                            <tr align="center" align="center">
                                <td colspan="9">
                                    <form name="EnviarMenú" action="menu.jsp" method="POST">
                                        <input type="submit" value="Menú" name="EnviarMenú" />
                                    </form>
                                </td>
                            </tr>
                    </table>
                    <br><br><br>
    </body>
    <footer>
        <p>Diseñado y desarrollado por el grupo Programación ATS - UNTELS</p>
    </footer>
</html>

