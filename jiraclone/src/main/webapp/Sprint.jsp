<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sprint</title>
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
		}
		
		.column {
		    flex: 1;
		    padding: 3px;
		}
		

		
		.left {
		    text-align: left;
		}
		
		.right {
		    text-align: right;
		}
		
		.separated-content {
		    padding-left: 25px;
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
		
		#proyectoForm {
		    width: 80%;
		}
				
				.form-group {
		    display: flex;
		    flex-direction: column;
		    margin-bottom: 15px;
		}
		
		.form-group label {
		    margin-bottom: 5px;
		}
		
		.form-group input,
		.form-group textarea {
		    padding: 10px;
		    width: 100%;
		}
		
		.buttons {
		    display: flex;
		    justify-content: space-between;
		    margin-top: 20px;
		}
		
		button {
		    padding: 10px 20px;
		    border: none;
		    cursor: pointer;
		}
		
		#cancelar {
		    background-color: white;
		    color: black;
		    border: 1px solid #ccc;
		}
		
		#cancelar:hover {
		    background-color: lightgrey;
		}
		
		button[type="submit"] {
		    background-color: black;
		    color: white;
		}
		
		button[type="submit"]:hover {
		    background-color: grey;
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
		#sprintForm {
	    display: flex;
	    flex-direction: column;
	    width: 80%;
		}
		
		.form-group {
		    display: flex;
		    flex-direction: column;
		    margin-bottom: 15px;
		}
		
		.form-group label {
		    margin-bottom: 5px;
		}
		
		.form-group input {
		    padding: 10px;
		    width: 100%;
		    margin-bottom: 5px;
		}
		
		.error {
		    color: red;
		    font-size: 12px;
		}
		
		.buttons {
		    display: flex;
		    justify-content: space-between;
		    margin-top: 20px;
		}
		
		button {
		    padding: 10px 20px;
		    border: none;
		    cursor: pointer;
		}
	
		#cancelar {
		    background-color: white;
		    color: black;
		    border: 1px solid #ccc;
		}
		
		#cancelar:hover {
		    background-color: lightgrey;
		}
		
		button[type="submit"] {
		    background-color: black;
		    color: white;
		}
		
		button[type="submit"]:hover {
		    background-color: grey;
		}
    </style>
</head>
<body>

	<div id="as" class="header">
        <h1>Jira Clone</h1>
    </div>
    
        <div class="content">
	        <div class=" left">
	           <h2><a href="ListaSprints.jsp" class="back-arrow"></a><span id="proyectoInfo"></span></h2>
	        </div>
    	</div> 
    	
    	<div class="separated-content">
        	<h3>Crear Nuevo Sprint</h3>
        	<p>Ingrese los detalles del nuevo Sprint para planificar el trabajo del equipo</p>
        	
        	<form id="sprintForm">
		        <div class="form-group">
		            <label for="nombre">Nombre del Sprint</label>
		            <input type="text" id="nombre" name="nombre" placeholder="Ej: Sprint3 - Desarrollo de funcionalidad X" required>
		            <span id="nombreError" class="error"></span>
		        </div>
		        <div class="form-group">
		            <label for="fechaInicio">Fecha de Inicio1</label>
		            <input type="date" id="fechaInicio" name="fechaInicio" placeholder="Seleccionar fecha" required>
		            <span id="fechaInicioError" class="error"></span>
		            <label for="fechaFin">Fecha de Finalizaci&oacute;n</label>
		            <input type="date" id="fechaFin" name="fechaFin" placeholder="Seleccionar fecha" required>
		            <span id="fechaFinError" class="error"></span>
		        </div>
		        <div class="buttons">
		            <button type="button" id="cancelar">Cancelar</button>
		            <button type="submit">Guardar Sprint</button>
		        </div>
   			 </form>
		            	
		</div>	
    <script>
        $(document).ready(function() {
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

            $('#cancelar').click(function() {
                $('#sprintForm')[0].reset();
                $('.error').text('');
            }); 

            $('#sprintForm').submit(function(event) {
                event.preventDefault();
                var nombre = $('#nombre').val();
                var fechaInicio = $('#fechaInicio').val();
                var fechaFin = $('#fechaFin').val();

                if (!nombre) {
                    $('#nombreError').text('Dato obligatorio');
                    return;
                }
                if (!fechaInicio) {
                    $('#fechaInicioError').text('Dato obligatorio');
                    return;
                }
                if (!fechaFin) {
                    $('#fechaFinError').text('Dato obligatorio');
                    return;
                }

                $.ajax({
                    url: '/jiraclone/api/sprints',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ nombre: nombre, fechaInicio: fechaInicio, fechaFin: fechaFin, idProyecto: idProyecto }),
                    success: function() {
                        window.location.href = 'ListaSprints.jsp';
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error al guardar el sprint:', textStatus, errorThrown);
                    }
                });
            });
        });
    </script>
</body>
</html>