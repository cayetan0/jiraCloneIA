package com.jiraClone.controller;


import com.jiraClone.model.ProductBacklogItem;
import com.jiraClone.service.ProductBacklogItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/api/productBacklogItems")
public class ProductBacklogItemController {

    @Autowired
    private ProductBacklogItemService service;

    @RequestMapping(value = "/{idProyecto}", method = RequestMethod.GET)
    @ResponseBody
    public List<ProductBacklogItem> getItems(@PathVariable int idProyecto) {
        return service.getItemsByProyectoId(idProyecto);
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    void createItem(@RequestBody ProductBacklogItem item) {
        service.saveItem(item);
    }
    
}