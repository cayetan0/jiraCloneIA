package com.jiraClone.repository;

import com.jiraClone.model.ProductBacklogItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductBacklogItemRepositoryImp {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<ProductBacklogItem> findByProyectoId(int idProyecto) {
        String sql = "SELECT * FROM ProductBacklogItem WHERE id_proyecto = ? and status = 0";
        return jdbcTemplate.query(sql, new Object[]{idProyecto}, (rs, rowNum) -> {
            ProductBacklogItem item = new ProductBacklogItem();
            item.setId(rs.getInt("id"));
            item.setTitulo(rs.getString("titulo"));
            item.setDescripcion(rs.getString("descripcion"));
            item.setIdProyecto(rs.getInt("id_proyecto"));
            return item;
        });
    }

    public void save(ProductBacklogItem item) {
        String sql = "INSERT INTO ProductBacklogItem (titulo, descripcion, id_proyecto) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, item.getTitulo(), item.getDescripcion(), item.getIdProyecto());
    }
    
    public int updateStatus(int id, int status) {
        String sql = "UPDATE ProductBacklogItem SET status = ? WHERE id = ?";
        return jdbcTemplate.update(sql, status, id);
    }
}
