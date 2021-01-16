package tools.dao;

import java.sql.SQLException;
import java.util.List;

import tools.entity.*;
import tools.entity.Page;

public interface Iorder {
    public List<order> queryOrderByPage(Page page) throws SQLException;
}
