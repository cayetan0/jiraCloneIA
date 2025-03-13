package com.jiraClone.service;

import com.jiraClone.model.SprintBacklogItem;
import com.jiraClone.repository.ProductBacklogItemRepositoryImp;
import com.jiraClone.repository.SprintBacklogItemRepositoryImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SprintBacklogItemService {

    @Autowired
    private SprintBacklogItemRepositoryImp repository;
    
    @Autowired
    private ProductBacklogItemRepositoryImp repositoryBac;

    public List<SprintBacklogItem> getItemsByProyectoId(int idProyecto) {
        return repository.findByProyectoId(idProyecto);
    }

    public void saveItem(SprintBacklogItem item) {
        repository.save(item);
        repositoryBac.updateStatus(item.getIdItem(), 1);
        
    }
}