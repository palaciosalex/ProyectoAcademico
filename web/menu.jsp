<%-- 
    Document   : Menu
    Created on : 20/07/2020, 07:18:03 PM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/estilosmenu.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <header>
            <h1>CRUD REGISTRO ACADEMICO</h1>
        </header>
        <div class="contenido">
            <div class="grid-container">
                <div class="grid-item">
                    <a href="DatosEstudiante.jsp"><img src="img/estudiante.png"></a>
                    <p>Estudiantes</p>
                </div>
                <div class="grid-item">
                    <a href="DatosCurso.jsp"><img src="img/libro.png"></a>
                    <p>Cursos</p>
                </div>
                <div class="grid-item">
                    <a href="DatosCarrera.jsp"><img src="img/birrete.png"></a>
                    <p>Carreras</p>
                </div>
                <div class="grid-item">
                    <a href="DatosMatricula.jsp"><img src="img/prueba.png"></a>
                    <p>Matriculas</p>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <p>Diseñado y desarrollado por el grupo Programación ATS - UNTELS</p>
    </footer>
</html>
