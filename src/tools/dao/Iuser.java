package tools.dao;

import java.sql.SQLException;
import java.util.List;

import tools.entity.*;
import tools.entity.Page;

public interface Iuser {
    public List<usershow> queryUsershowByPage(Page page) throws SQLException;
}
