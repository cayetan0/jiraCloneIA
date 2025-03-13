<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ListaSprint</title>
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
		    padding: 3px;
		    width: 85%;
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
		.back-arrow {
		    display: inline-flex;
		    align-items: center;
		    text-decoration: none;
		    color: black;
		    font-size: 20px;
		    padding: 0px 20px;
		    border: 0p x solid #ccc;
		    background-color: white;
		    cursor: pointer;
		}
		
		.back-arrow::before {
		    content: '\2190'; /* Unicode for left arrow */
		    margin-right: 0px;
		    font-size: 20px;
		}
	
		.sprint {
		    border: 1px solid #ccc;
		    padding: 15px;
		    margin: 10px 25px;
		    display: flex;
		    flex-direction: column;
		    align-items: flex-start;
		    width: 80%;
		}
		
		.sprint p {
		    margin: 0 0 10px 0;
		}
		
		.ver-detalle {
		    align-self: flex-end;
		    background-color: white;
		    color: black;
		    border: 1px solid #ccc;
		    padding: 10px 20px;
		    cursor: pointer;
		    display: flex;
		    align-items: center;
		}
		
		.ver-detalle i {
		    margin-right: 5px;
		}
	    </style>
</head>
<body>

	<div class="header">
        <h1>Jira Clone</h1>
    </div>
    
    
    	<div class="content">
	        <div class=" left">
	           <h2><a href="ListaProyectos.jsp" class="back-arrow"></a><span id="proyectoInfo"></span></h2>
	        </div>
	        
	        <div class="columnB right">
           	 <button id="crearSprint"><i class="fas fa-plus-circle"></i> Crear Sprint</button>
        	</div>
    	</div> 
    	 <div class="separated-content">
	        <h3>Sprint</h3>   
	        <p><span id="numSprints"></span> Sprints </p> 
	         
    	</div>
    	
    	<div id="sprints-container"></div> 


    <script>
	    $(document).ready(function() {
	    	 $('#crearSprint').click(function() {
		            window.location.href = 'Sprint.jsp';
		        });
	    	
	        var idProyecto = sessionStorage.getItem('idProyecto');
	        $.ajax({
	            url: '/jiraclone/api/proyectos/' + idProyecto,
	            method: 'GET',
	            success: function(data) {
	                $('#proyectoInfo').text(data.nombre + ' - ' + data.descripcion);
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error('Error al obtener el proyecto:', textStatus, errorThrown);
	            }
	        });
        
            $.ajax({
                url: '/jiraclone/api/sprints/' + idProyecto,
                method: 'GET',
                success: function(sprints) {
                	const container = $('#sprints-container');
                	$('#numSprints').text(sprints.length);
                    sprints.forEach(sprint => {
                        const div = $('<div>').addClass('sprint');

                        const nombreDescripcion = $('<H4>').html(`<strong> ${sprint.nombre} -  ${sprint.descripcion || 'N/A'}</strong>`);
                        div.append(nombreDescripcion);

                        const fechaInicio = new Date(sprint.fechaInicio).toLocaleDateString();
                        const fechaFin = new Date(sprint.fechaFin).toLocaleDateString();
                        const fechas = $('<p>').text(`Fecha de Inicio: ${fechaInicio} - Fecha de Fin: ${fechaFin}`);
                        div.append(fechas);

                        const verDetalleButton = $('<button>')
                            .addClass('ver-detalle')
                            .html(' Ver Detalle')
                            .click(function() {
                                sessionStorage.setItem('idSprint', sprint.id);
                                window.location.href = 'SprintDetalle.jsp';
                            });
                        div.append(verDetalleButton);

                        container.append(div);
                    });
                },
                error: function(error) {
                    console.error('Error al obtener los sprints:', error);
                }
            });
        });
    </script>
</body>
</html>