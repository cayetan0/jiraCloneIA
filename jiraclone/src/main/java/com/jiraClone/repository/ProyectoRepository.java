package com.jiraClone.repository;
import java.util.List;
import com.jiraClone.model.Proyecto;

public interface ProyectoRepository {    
    public List<Proyecto> findAll();
    public void save(Proyecto proyecto);
	public Proyecto findById(int id);
	
       
}

