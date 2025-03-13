package com.jiraClone.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import com.jiraClone.model.Proyecto;
import com.jiraClone.service.ProyectoService;

@Controller
public class ProyectoController {

	@Autowired
	private ProyectoService proyectoService;

	@RequestMapping(value="/api/proyectos", method = RequestMethod.GET)
	@ResponseBody
	public  List<Proyecto> getProyectos() {		
		return proyectoService.getAllProyectos();
	}
	
	@RequestMapping(value="/api/proyectos", method = RequestMethod.POST)
	@ResponseBody
    public void createProyecto(@RequestBody Proyecto proyecto) {
        proyectoService.saveProyecto(proyecto);
    }
	
	@RequestMapping(value="/api/proyectos/{id}", method = RequestMethod.GET)
	@ResponseBody
    public ResponseEntity<Proyecto> getProyectoById(@PathVariable int id) {
        Proyecto proyecto = proyectoService.getProyectoById(id);
        if (proyecto != null) {
            return new ResponseEntity<>(proyecto, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}	


