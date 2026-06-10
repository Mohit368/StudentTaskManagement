<%@ page import="java.util.List" %>
<%@ page import="model.Task" %>

<%
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Tasks</title>
</head>
<body>

<h2>My Tasks</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Due Date</th>
        <th>Priority</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        if (tasks != null && !tasks.isEmpty()) {
            for (Task task : tasks) {
    %>
    <tr>
        <td><%= task.getId() %></td>
        <td><%= task.getTitle() %></td>
        <td><%= task.getDescription() %></td>
        <td><%= task.getDueDate() %></td>
        <td><%= task.getPriority() %></td>
        <td><%= task.getStatus() %></td>
        <td>
            <a href="deleteTask?id=<%= task.getId() %>">Delete</a>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="7">No tasks found.</td>
    </tr>
    <%
        }
    %>
</table>

<br>
<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>