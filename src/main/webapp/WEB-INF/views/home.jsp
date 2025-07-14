<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Forum - Home</title>
    <link rel="stylesheet" href="<c:url value='/CSS/home.css'/>">
</head>
<body>

<div class="container">
    <h2>Welcome, ${sessionScope.user.username}</h2>

    <p><a href="/logout" class="logout-link">Logout</a></p>

    <!-- Create Post Form -->
    <div class="form-container">
        <h3>Create a new Post</h3>
        <form action="/posts" method="post">
            <label>Title:</label>
            <input type="text" name="title" required />

            <label>Content:</label>
            <textarea name="content" rows="4" required></textarea>

            <button type="submit">Post</button>
        </form>
    </div>

    <!-- Posts Display -->
    <h3>All Posts</h3>
    <div id="posts">
        <c:forEach items="${posts}" var="post">
            <div class="post-card">
                <h4>${post.title}</h4>
                <p>${post.content}</p>
                <p><strong>Author:</strong> ${post.author.username}</p>
                
                <p><strong>Status:</strong>
                    <c:choose>
                        <c:when test="${post.resolved}">
                            ✅ Resolved
                        </c:when>
                        <c:otherwise>
                            ❌ Not Resolved
                        </c:otherwise>
                    </c:choose>
                </p>

                <a href="/posts/view/${post.id}" class="btn">View & Comment</a>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
