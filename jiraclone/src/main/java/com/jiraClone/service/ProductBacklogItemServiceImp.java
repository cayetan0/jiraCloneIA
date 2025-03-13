package com.jiraClone.service;

import com.jiraClone.model.ProductBacklogItem;
import com.jiraClone.repository.ProductBacklogItemRepositoryImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductBacklogItemServiceImp  implements ProductBacklogItemService{

    @Autowired
    private ProductBacklogItemRepositoryImp repository;

    public List<ProductBacklogItem> getItemsByProyectoId(int idProyecto) {
        return repository.findByProyectoId(idProyecto);
    }

    public void saveItem(ProductBacklogItem item) {
        repository.save(item);
    }
    
    public boolean updateStatus(int id, int status) {
        return repository.updateStatus(id, status) > 0;
    }
}