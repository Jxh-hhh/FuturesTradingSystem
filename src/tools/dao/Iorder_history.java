package tools.dao;

import tools.entity.Page;
import tools.entity.order_history;

import java.sql.SQLException;
import java.util.List;

public interface Iorder_history {
    public List<order_history> queryOrderByPage(Page page) throws SQLException;
    public String delete(String order_id);
}
