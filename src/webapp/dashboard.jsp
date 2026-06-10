<%@ page import="model.Student" %>
<%@ page import="dao.TaskDAO" %>

<%
    Student student = (Student) session.getAttribute("student");

    if (student == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    TaskDAO taskDAO = new TaskDAO();

    int totalTasks = taskDAO.getTaskCount(student.getId(), "");
    int pendingTasks = taskDAO.getTaskCount(student.getId(), "AND status='Pending'");
    int completedTasks = taskDAO.getTaskCount(student.getId(), "AND status='Completed'");
    int highPriorityTasks = taskDAO.getTaskCount(student.getId(), "AND priority='High'");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Student Task Management System</span>
    <a href="logout" class="btn btn-danger">Logout</a>
</nav>

<div class="container mt-5">

    <h2 class="mb-4">Welcome, <%= student.getName() %></h2>

    <div class="row g-4 mb-4">

        <div class="col-md-3">
            <div class="card shadow text-center border-primary">
                <div class="card-body">
                    <h5>Total Tasks</h5>
                    <h2><%= totalTasks %></h2>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow text-center border-warning">
                <div class="card-body">
                    <h5>Pending</h5>
                    <h2><%= pendingTasks %></h2>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow text-center border-success">
                <div class="card-body">
                    <h5>Completed</h5>
                    <h2><%= completedTasks %></h2>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card shadow text-center border-danger">
                <div class="card-body">
                    <h5>High Priority</h5>
                    <h2><%= highPriorityTasks %></h2>
                </div>
            </div>
        </div>

    </div>

    <div class="card shadow">
        <div class="card-body">
            <h4>Quick Actions</h4>
            <a href="add-task.jsp" class="btn btn-primary mt-3">Add Task</a>
            <a href="viewTasks" class="btn btn-success mt-3">View Tasks</a>
        </div>
    </div>

</div>

</body>
</html>