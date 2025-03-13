package com.jiraClone.service;

import java.util.List;

import com.jiraClone.model.ProductBacklogItem;

public interface ProductBacklogItemService {
	
	public List<ProductBacklogItem> getItemsByProyectoId(int idProyecto);
    public void saveItem(ProductBacklogItem item);    
    public boolean updateStatus(int id, int status);

}
