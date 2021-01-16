package tools.dao;

import java.sql.SQLException;
import java.util.List;

import tools.entity.*;
import tools.entity.Page;

public interface Igp {
	public List<gp> queryGpByPage(Page page, String type) throws SQLException;
}
