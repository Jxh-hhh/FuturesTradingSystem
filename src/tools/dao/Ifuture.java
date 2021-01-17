package tools.dao;

import tools.entity.Page;
import tools.entity.future;

import java.sql.SQLException;
import java.util.List;

public interface Ifuture {
    public List<future> queryFutureByPage(Page page) throws SQLException;
    public List<future> queryAll() throws SQLException;
}
