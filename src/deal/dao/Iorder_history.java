package deal.dao;

import deal.entity.Page;
import deal.entity.order_history;

import java.sql.SQLException;
import java.util.List;

public interface Iorder_history {
    public List<order_history> queryOrderByPage(Page page) throws SQLException;
}
