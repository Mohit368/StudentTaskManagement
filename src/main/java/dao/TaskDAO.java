package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Task;
import util.DBConnection;

public class TaskDAO {

    public boolean addTask(Task task) {
        boolean status = false;

        String sql = "INSERT INTO tasks(student_id, title, description, due_date, priority, status) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, task.getStudentId());
            ps.setString(2, task.getTitle());
            ps.setString(3, task.getDescription());
            ps.setString(4, task.getDueDate());
            ps.setString(5, task.getPriority());
            ps.setString(6, task.getStatus());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Task> getTasksByStudentId(int studentId) {
        List<Task> tasks = new ArrayList<>();

        String sql = "SELECT * FROM tasks WHERE student_id = ?";

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Task task = new Task();

                task.setId(rs.getInt("id"));
                task.setStudentId(rs.getInt("student_id"));
                task.setTitle(rs.getString("title"));
                task.setDescription(rs.getString("description"));
                task.setDueDate(rs.getString("due_date"));
                task.setPriority(rs.getString("priority"));
                task.setStatus(rs.getString("status"));

                tasks.add(task);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return tasks;
    }

    public boolean deleteTask(int taskId) {
        boolean status = false;

        String sql = "DELETE FROM tasks WHERE id = ?";

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, taskId);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public boolean markTaskCompleted(int taskId) {
        boolean status = false;

        String sql = "UPDATE tasks SET status = 'Completed' WHERE id = ?";

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, taskId);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public int getTaskCount(int studentId, String condition) {
        int count = 0;

        String sql = "SELECT COUNT(*) FROM tasks WHERE student_id = ? " + condition;

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}