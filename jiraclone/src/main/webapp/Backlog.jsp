<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Backlog</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    <
    
    </style>
</head>
<body>     
    <div  class="header">
        <h1>Jira Clone</h1>
    </div>
    
        <div class="content">
	        <div class="separated-content">
	           <h2><a href="ProductBacklog.jsp" class="back-arrow"></a><span id="proyectoInfo"></span></h2>
	           <p>Gesti&oacute;n de tareas pendientes del proyecto</p>
	        </div>
    	</div> 
    	
    	
    	<form id="backlogForm">
	    	<div class="separated-content">
	    		<h3>Item del Backlog</h3>
	    		
	        	<h3>Crear Nuevo Itema</h3>
	        	<p>Ingrese los detalles del nuevo Sprint para planificar el trabajo del equipo</p>
	        
	        <div class="form-group">
			            <label for="titulo">Titulo</label>
			            <input type="text" id="titulo" name="titulo" placeholder="Ej: Implementar Funcionalidad de b&uacute;squeda" required>
			            <span id="tituloError" class="error"></span>
			        </div>
			        <div class="form-group">
			            <label for="descripcion">Descripci&oacute;n</label>
			            <textarea id="descripcion" name="descripcion" placeholder="Describa los detalles del Item" required></textarea>
			            <span id="descripcionError" class="error"></span>
			        </div>
			        <div class="buttons">
			            <button type="button" id="cancelar">Cancelar</button>
			            <button type="submit">Guardar Item</button>
			        </div>
	        	
	        </div>
	    </form>
	    
    <script>
        $(document).ready(function() {
            var idProyecto = sessionStorage.getItem('idProyecto');
            $.ajax({
                url: '/jiraclone/api/proyectos/' + idProyecto,
                method: 'GET',
                success: function(data) {
                    $('#proyectoInfo').text('Product Backlog ' + data.nombre);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Error al obtener el proyecto:', textStatus, errorThrown);
                }
            });

            $('#cancelar').click(function() {
                $('#backlogForm')[0].reset();
                $('.error').text('');
            });

            $('#backlogForm').submit(function(event) {
                event.preventDefault();
                var titulo = $('#titulo').val();
                var descripcion = $('#descripcion').val();

                if (!titulo) {
                    $('#tituloError').text('Dato obligatorio');
                    return;
                }
                if (!descripcion) {
                    $('#descripcionError').text('Dato obligatorio');
                    return;
                }

                $.ajax({
                    url: '/jiraclone/api/productBacklogItems',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ titulo: titulo, descripcion: descripcion, idProyecto: idProyecto }),
                    success: function() {
                        window.location.href = 'ProductBacklog.jsp';
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error al guardar el item:', textStatus, errorThrown);
                    }
                });
            });
        });
    </script>
</body>
</html>