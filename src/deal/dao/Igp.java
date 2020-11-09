package deal.dao;

import java.sql.SQLException;
import java.util.List;

import deal.entity.*;
import deal.entity.Page;

public interface Igp {
	public List<gp> queryGpByPage(Page page) throws SQLException;
}
