<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>🛠 Generate Crossword </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            color: white;
            margin: 0;
        }
        .card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 30px;
            width: 500px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.4);
            animation: fadeIn 0.8s ease-in-out;
            margin: auto;
            margin-top: 100px;
        }
        .card h2 { font-weight: 700; color: white; text-align: center; margin-bottom: 20px; }
        .form-label { font-weight: 500; color: #f1f1f1; }
        textarea { resize: none; border-radius: 12px !important; }
        .btn-generate {
            background: #ff7eb3; border: none; font-size: 18px; font-weight: bold;
            border-radius: 12px; transition: 0.3s;
        }
        .btn-generate:hover {
            background: #ff4f91; transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0,0,0,0.4);
        }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark" style="background: rgba(0, 0, 0, 0.7); backdrop-filter: blur(10px);">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">🧩 CrossMaster </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="generate.jsp">🛠 Generate</a></li>
                    <li class="nav-item"><a class="nav-link" href="solve.jsp">🔍 Solve</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.jsp">🏠 Home</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="card shadow-lg">
        <h2>🛠 Generate Crossword</h2>
        <form action="generate" method="post">
            <div class="mb-3">
                <label for="words" class="form-label">✏️ Enter words (comma separated) :</label>
                <textarea name="words" id="words" class="form-control p-3" rows="4" 
                    placeholder="E.g. JAVA, SERVLET, JSP, TOMCAT" required></textarea>
            </div>
            <button type="submit" class="btn btn-generate w-100">🚀 Generate Crossword</button>
        </form>
    </div>
</body>
</html>
