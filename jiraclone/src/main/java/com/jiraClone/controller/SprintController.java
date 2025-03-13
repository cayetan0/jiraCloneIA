package com.jiraClone.controller;

import com.jiraClone.model.Proyecto;
import com.jiraClone.model.Sprint;
import com.jiraClone.service.SprintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/api/sprints")
public class SprintController {

    @Autowired
    private SprintService sprintService;

    @RequestMapping(value="/api/sprints/getall", method = RequestMethod.GET)
	@ResponseBody
	public  List<Sprint> getSprintsAll() {		
		return sprintService.getAllSprint();
	}
    
    @RequestMapping(value = "/{idProyecto}", method = RequestMethod.GET)
    @ResponseBody
    public List<Sprint> getSprints(@PathVariable int idProyecto) {
        return sprintService.getSprintsByProyectoId(idProyecto);
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public void createSprint(@RequestBody Sprint sprint) {
        sprintService.saveSprint(sprint);
    }
}