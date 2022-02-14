package data.model.dao;

import java.sql.*;
import java.util.List;

public interface DAO <T> {
    public int add(T data)
            throws SQLException;
    public void delete(int id)
        throws SQLException;
    public T getOne(int id)
        throws SQLException;
    public List<T> getAll()
        throws SQLException;
    public void update(T data)
        throws SQLException;
}
