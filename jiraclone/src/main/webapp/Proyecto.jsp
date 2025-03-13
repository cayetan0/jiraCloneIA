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
		.separated-content {
		    padding-left: 25px;
		    border: 1px solid #ccc;
		    width: 90%;
		}
    </style>
</head>
<body>
 	
 	<div id="as" class="header">
        <h1>Jira Clone</h1>
    </div>
    
        <div class="separated-content">
	        <div class=" left">
	           <h2><a href="ListaProyectos.jsp" class="back-arrow"></a>Proyectos</h2>
	        </div>
    	</div> 
    	
    	<div class="separated-content">
        	<h3>Crear Nuevo Proyecto</h3>
        	<p>Ingrese los detalles del nuevo proyecto para iniciar la planificaci&oacute;n del trabajo </p>
 	        
	       <form id="proyectoForm">
		        <div class="form-group">
		            <label class=" "  for="nombre">Nombre del Proyecto</label>
		            <input type="text" id="nombre" name="nombre" placeholder="Ingrese el nombre del proyecto" required>
		            <span id="nombreError" class="error"></span>
		        </div>
		        <div class="form-group">
		            <label for="descripcion">Descripci&oacute;n</label>
		            <textarea id="descripcion" name="descripcion" placeholder="Describa el prop&oacute;sito y alcance del proyecto"></textarea>
		        </div>
		        <div class="buttons">
		            <button type="button" id="cancelar">Cancelar</button>
		            <button type="submit">Guardar Proyecto</button>
		        </div>
		    </form>
	        
	    </div>
    <script>
        $(document).ready(function() {
            $('#cancelar').click(function() {
                $('#proyectoForm')[0].reset();
                $('#nombreError').text('');
            });

            $('#proyectoForm').submit(function(event) {
                event.preventDefault();
                var nombre = $('#nombre').val();
                var descripcion = $('#descripcion').val();

                if (!nombre) {
                    $('#nombreError').text('Dato obligatorio');
                    return;
                }

                $.ajax({
                    url: '/jiraclone/api/proyectos',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ nombre: nombre, descripcion: descripcion }),
                    success: function() {
                        window.location.href = 'ListaProyectos.jsp';
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error al guardar el proyecto:', textStatus, errorThrown);
                    }
                });
            });
        });
    </script>
</body>
</html>