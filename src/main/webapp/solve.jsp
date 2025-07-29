<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>🔍 Solve Crossword</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            margin: 0;
        }
        .card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            color: white;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.4);
            padding: 35px;
            width: 550px;
            animation: fadeIn 0.8s ease-in-out;
            margin: auto;
            margin-top: 100px;
        }
        h2 { text-align: center; font-weight: 700; margin-bottom: 25px; text-shadow: 2px 2px 6px rgba(0,0,0,0.3); }
        textarea, input { border-radius: 12px !important; border: none !important; padding: 12px; }
        textarea:focus, input:focus { outline: none; box-shadow: 0 0 8px rgba(255,255,255,0.6); }
        .btn-solve {
            background: #ff7eb3; color: white; font-weight: bold; border: none;
            border-radius: 12px; padding: 12px; font-size: 18px;
            transition: all 0.3s ease-in-out;
        }
        .btn-solve:hover {
            background: #ff4f91; transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark" style="background: rgba(0, 0, 0, 0.7); backdrop-filter: blur(10px);">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">🧩 CrossMaster</a>
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


    <div class="card">
        <h2>🔍 Solve Crossword</h2>
        <form action="solve" method="post">
            <div class="mb-3">
                <label for="crossword" class="form-label">📄 Paste your crossword grid :</label>
                <textarea name="crossword" id="crossword" class="form-control" rows="6"
                    placeholder="E.g. G A P P F J N R R J" required></textarea>
            </div>
            <div class="mb-3">
                <label for="words" class="form-label">✏️ Enter words/clues:</label>
                <input type="text" name="words" id="words" class="form-control"
                    placeholder="E.g. JAVA, SERVLET, TOMCAT" required>
            </div>
            <button type="submit" class="btn btn-solve w-100">🚀 Solve Now</button>
        </form>
    </div>
</body>
</html>
