<%@ page import="model.Student" %>

<%
    Student student = (Student) session.getAttribute("student");

    if (student == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Task</title>
</head>
<body>

<h2>Add New Task</h2>

<form action="addTask" method="post">
    <input type="text" name="title" placeholder="Task Title" required><br><br>

    <textarea name="description" placeholder="Task Description" required></textarea><br><br>

    <input type="date" name="dueDate" required><br><br>

    <select name="priority" required>
        <option value="">Select Priority</option>
        <option value="Low">Low</option>
        <option value="Medium">Medium</option>
        <option value="High">High</option>
    </select><br><br>

    <button type="submit">Add Task</button>
</form>

<br>
<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>