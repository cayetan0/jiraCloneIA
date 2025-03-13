<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Backlog</title>
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
		
		.contenedor {
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
		    align: left;
		}
		
		.right {
		    text-align: right;
		}
		
		.separated-content {
		    padding-left: 25px;
		    border: 1px solid #ccc;
		    width: 90%;
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
		
		.sprint-backlog-item {
		    border: 1px solid #ccc;
		    padding: 20px;
		    margin: 10px 0;
		    display: flex;
		    flex-direction: column;
		    width: 90%;
		}
		
		.sprint-backlog-item p {
		    margin: 0 0 10px 0;
		    color: black;
		}
		
		.sprint-descripcion {
		    text-align: right;
		    padding: 10px;
		    border-radius: 5px;
		    float: right;
		    
		}
          .item {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px 0;
            width: 90%;
        }
        .item p {
            margin: 5px 0;
        }
        .item p:first-child {
            font-weight: bold;
        }
        .item button {
            display: inline-block;
            padding: 5px 10px;
            background-color: white;
            color: black;
            border: none;
            cursor: pointer;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <header Class="header">
        <h1>JiraClone</h1>
    </header>
            
  		<div class="content">
	        <div class=" left">
	            <h2><a href="ListaProyectos.jsp" class="back-arrow"></a> Product Backlog  <span id="proyectoInfo"></span></h2>
	        </div>
	        
	        <div class="columnB right">
           	 <button id="crearItem"><i class="fas fa-plus-circle"></i> Crear Item</button>
        	</div>
    	</div> 
    	
        
        
        <div class = "separated-content">
            <h3>Items sin asignar</h3>
            <p>Items que a&uacute;n no han sido asignados a ning&uacute;n sprint</p>
             <div id="contenedor"></div>
             
        </div>    
          <br><br>

        <div class="separated-content">
            <h3>Items asignados a Sprint</h3>
            <p>Items que ya han sido asignados a sprints espec&iacute;ficos</p>            
            <div id="sprint-backlog-container"></div>
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

	    $('#crearItem').click(function() {
	        window.location.href = 'Backlog.jsp';
	    });

        function cargarItems() {
        
        	  $.ajax({
			        url: '/jiraclone/api/sprintBacklogItems/' + idProyecto,
			        method: 'GET',
			        success: function(items) {
			            const container = $('#sprint-backlog-container');
		
			            items.forEach(item => {
			                const div = $('<div>').addClass('sprint-backlog-item');
		
			                const titulo = $('<p>').html(`<strong>${item.titulo}</strong>`);
			                div.append(titulo);
			                
			                const descripcion = $('<p>').html(`${item.descripcion}`);
			                div.append(descripcion);
		
			                const sprintDescripcion = $('<div>').addClass('sprint-descripcion').text(item.sprintDescripcion).addClass('right');
			                div.append(sprintDescripcion);
		
			                container.append(div);
			            });
			        },
			        error: function(error) {
			            console.error('Error al obtener los items:', error);
			        }
			    });
        	
            $.ajax({
                url: '/jiraclone/api/productBacklogItems/' + idProyecto,
                method: 'GET',
                success: function(data) {
                	 const container = $('#contenedor');
                
                    data.forEach(item => {
			                const div = $('<div>').addClass('sprint-backlog-item');
		
			                const titulo = $('<p>').html(`<strong>${item.titulo}</strong>`);
			                div.append(titulo);
			                
			                const descripcion = $('<p>').html(`${item.descripcion}`);
			                div.append(descripcion);
		
			                const boton = $('<div>').addClass('right').append($('<button>').attr('id', 'asignarSprint').attr('data-id',item.id).text('Asignar a Sprint'));
			                div.append(boton);
		
			                container.append(div);
			            });
                    

                    $('#asignarSprint').click(function() {
                        var idItem = $(this).data('id');
                        $.ajax({
                            url: '/jiraclone/api/sprints/' + idProyecto,
                            method: 'GET',
                            success: function(sprints) {
                                var sprintOptions = '<select id="sprintSelect">';
                                sprints.forEach(function(sprint) {
                                    sprintOptions += '<option value="' + sprint.id + '">' + sprint.nombre + '</option>';
                                });
                                sprintOptions += '</select>';
                                sprintOptions += '<button id="confirmarAsignacion">Confirmar</button>';
                                $('#contenedor').after(sprintOptions);

                                $('#confirmarAsignacion').click(function() {
                                    var idSprint = $('#sprintSelect').val();
                                    $.ajax({
                                        url: '/jiraclone/api/sprintBacklogItems',
                                        method: 'POST',
                                        contentType: 'application/json',
                                        data: JSON.stringify({ idSprint: idSprint, idItem: idItem }),
                                        success: function() {
                                        	$('#sprintSelect').remove(); 
                                        	$('#confirmarAsignacion').remove();
                                        	window.location.href = 'ProductBacklog.jsp';
                                        },
                                        error: function(jqXHR, textStatus, errorThrown) {
                                            console.error('Error al asignar el item:', textStatus, errorThrown);
                                        }
                                    });
                                });
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.error('Error al obtener los sprints:', textStatus, errorThrown);
                            }
                        });
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Error al obtener los items:', textStatus, errorThrown);
                }
            });

        }
	    cargarItems();
	});     
  </script>
</body>
</html>