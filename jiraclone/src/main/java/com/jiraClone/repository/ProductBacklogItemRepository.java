package com.jiraClone.repository;

import java.util.List;

import com.jiraClone.model.ProductBacklogItem;

public interface ProductBacklogItemRepository {
	public List<ProductBacklogItem> findByProyectoId(int idProyecto) ;
	 public void save(ProductBacklogItem item);
	 public int updateStatus(int id, int status) ;
}
