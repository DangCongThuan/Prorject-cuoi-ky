package com.group56.dao.impl;

import com.group56.dao.IGenericDAO;
import com.group56.mapper.IRowMapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class AbstractDAO<T> implements IGenericDAO<T> {
    ResourceBundle resourceBundle = ResourceBundle.getBundle("db");

    public Connection getConnection() {
        try {
            Class.forName(resourceBundle.getString("driverName"));
            String url = resourceBundle.getString("url");
            String user = resourceBundle.getString("user");
            String password = resourceBundle.getString("password");
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters) {
        List<T> results = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);

            setParameter(preparedStatement, parameters);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                results.add(rowMapper.mapRow(resultSet));
            }
            return results;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
    }

    private static void setParameter(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; i++) {
                int index = i + 1;
                Object parameter = parameters[i];
                if (parameter instanceof Long) {
                    statement.setLong(index, (Long) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(index, (String) parameter);
                } else if (parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                } else if (parameter instanceof Timestamp) {
                    statement.setTimestamp(index, (Timestamp) parameter);
                } else if (parameter instanceof Double) {
                    statement.setDouble(index, (Double) parameter);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(sql);

            setParameter(preparedStatement, parameters);
            preparedStatement.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }

        } finally {
            try {

                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }

    }

    @Override
    public Long insert(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Long result = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            setParameter(preparedStatement, parameters);
            preparedStatement.executeUpdate();
            resultSet = preparedStatement.getGeneratedKeys();
            while (resultSet.next()) {
                result = resultSet.getLong(1);
            }
            connection.commit();
            return result;
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }

        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    @Override
    public int count(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int result = 0;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(sql);

            setParameter(preparedStatement, parameters);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                result = resultSet.getInt(1);
            }
            connection.commit();
            return result;
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }

        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
}
