package com.jiraClone.service;

import com.jiraClone.model.Proyecto;
import java.util.List;


public interface ProyectoService {
   
	 public List<Proyecto> getAllProyectos() ;
	 public void saveProyecto(Proyecto proyecto);
	public Proyecto getProyectoById(int id);
	        
}
