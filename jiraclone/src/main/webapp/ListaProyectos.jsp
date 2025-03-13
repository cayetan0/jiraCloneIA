<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Proyectos</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style type="text/css">    
    body {
    margin: 0;
    font-family: Arial, sans-serif;
		}
		
		.header {
		    background-color: black;
		    color: white;
		    text-align: left;
		    padding: 3px;
		}
		
		.content {
		    display: flex;		  
		     width: 80%;
		}
		
		.column {
		    flex: 1;
		    padding: 3px;
		}
		
		.columnB {
		    flex: 1;
		    padding: 10px;
		    align-content: space-around
		}
		
		.left {
		    text-align: left;
		}
		
		.right {
		    text-align: right;
		}
		
		.separated-content {
		    padding-left: 25px;
		    width: 80%;
		}
		.proyecto {
	    border: 1px solid #ccc;
	    padding: 20px;
	    margin: 10px 0;
	     width: 80%;
		}

		h2 {
		    color: black;
		}
		
		p {
		    color: grey;
		}
		
		button {
		    background-color: black;
		    color: white;
		    border: none;
		    padding: 10px 20px;
		    cursor: pointer;
   			position: relative;
    		padding-left: 40px; /* Espacio para el ícono */
		}
		
		button:hover {
		    background-color: lightgrey;
		} 
		
		button i {
		    position: absolute;
		    left: 10px;
		    top: 50%;
		    transform: translateY(-50%);
		    font-size: 20px;
		    color: white;
		}  
		.buttonBlack {
		    background-color: black;
		    color: white;
		    border: 1px solid #ccc;
		     margin-right: 20px;
		}
		
		.buttonWhite {
		    background-color: white;
		    color: black;
		    border: 1px solid #ccc;
		}
		
		button:last-child {
		    margin-right: 10px;
		}     
    </style>
</head>
<body>

	<div class="header">
        <h1>Jira Clone</h1>
    </div>
    <div class="separated-content">
        <div class="column left">
            <h2>Proyectos</h2>
            <p>Selecciona un proyecto para comenzar a trabajar</p>
        </div>
        <div class="columnB right">
            <button id="crearProyecto"><i class="fas fa-plus-circle"></i> Crear Proyecto</button>
        </div>
    </div>      
       <div class="separated-content">
        <h3>Todos los Proyectos</h3>
        <p><span id="numProyectos"></span> proyectos disponibles </p>
        
        <div id="proyectos-container"></div>
        
    </div>
    <script>
        $(document).ready(function() {
            $('#crearProyecto').click(function() {
                window.location.href = 'Proyecto.jsp';
            });
            $.ajax({
                url: '/jiraclone/api/proyectos',
                method: 'GET',
                success: function(proyectos) {
                	$('#numProyectos').text(proyectos.length);
                    const container = $('#proyectos-container');

                    proyectos.forEach(proyecto => {
                        const div = $('<div>').addClass('proyecto');

                        const nombre = $('<H4>').text(` ${proyecto.nombre}`);
                        div.append(nombre);

                        const descripcion = $('<p>').text(` ${proyecto.descripcion}`);
                        div.append(descripcion);

                        const verSpringButton = $('<button>')
                            .addClass('buttonBlack')
                            .html('<i class="fas fa-check-circle"></i> Ver Spring')
                            .click(function() {
                                sessionStorage.setItem('idProyecto', proyecto.id);
                                window.location.href = 'ListaSprints.jsp';
                            });
                        div.append(verSpringButton);

                        const productBacklogButton = $('<button>')
                            .addClass('buttonWhite')
                            .html('<i class="fas fa-list"></i> Product Backlog')
                            .click(function() {
                                sessionStorage.setItem('idProyecto', proyecto.id);
                                window.location.href = 'ProductBacklog.jsp';
                            });
                        div.append(productBacklogButton);

                        container.append(div);
                    });
                },
                error: function(error) {
                    console.error('Error al obtener los proyectos:', error);
                }
            });
        });
    </script>
</body>
</html>