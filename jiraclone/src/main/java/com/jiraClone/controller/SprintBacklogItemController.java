package com.jiraClone.controller;

import com.jiraClone.model.SprintBacklogItem;
import com.jiraClone.service.SprintBacklogItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/api/sprintBacklogItems")
public class SprintBacklogItemController {

    @Autowired
    private SprintBacklogItemService service;

    @RequestMapping(value = "/{idProyecto}", method = RequestMethod.GET)
    @ResponseBody
    public List<SprintBacklogItem> getItems(@PathVariable int idProyecto) {
        return service.getItemsByProyectoId(idProyecto);
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public void createItem(@RequestBody SprintBacklogItem item) {
        service.saveItem(item);
    }
}