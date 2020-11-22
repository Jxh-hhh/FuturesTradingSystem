package deal.dao;

import java.sql.SQLException;
import java.util.List;

import deal.entity.*;
import deal.entity.Page;

public interface Iuser {
    public List<usershow> queryUsershowByPage(Page page) throws SQLException;
}
