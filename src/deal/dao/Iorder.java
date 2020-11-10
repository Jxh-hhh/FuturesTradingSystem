package deal.dao;

import java.sql.SQLException;
import java.util.List;

import deal.entity.*;
import deal.entity.Page;

public interface Iorder {
    public List<order> queryOrderByPage(Page page) throws SQLException;
}
