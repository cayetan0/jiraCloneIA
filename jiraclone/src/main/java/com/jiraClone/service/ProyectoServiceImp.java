package com.jiraClone.service;

import com.jiraClone.model.Proyecto;
import com.jiraClone.repository.ProyectoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class ProyectoServiceImp implements ProyectoService{

    @Autowired
    private ProyectoRepository proyectoRepository;


    public List<Proyecto> getAllProyectos() {
        return proyectoRepository.findAll();
    }

    public void saveProyecto(Proyecto proyecto) {
        proyectoRepository.save(proyecto);
    }
    
    public Proyecto getProyectoById(int id) {
        return proyectoRepository.findById(id);
    }
}
