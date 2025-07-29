<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>✅ Crossword Generated </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            color: white;
            padding-top: 70px; 
        }
        .navbar {
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
        }
        .card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 30px;
            width: 700px;
            margin: auto;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
            animation: fadeIn 0.8s ease-in-out;
        }
        h2 {
            font-weight: 700;
            margin-bottom: 25px;
            text-align: center;
            text-shadow: 2px 2px 6px rgba(0,0,0,0.3);
        }
        table.crossword {
            margin: auto;
            border-collapse: collapse;
            animation: fadeInGrid 1s ease-in-out;
        }
        table.crossword td {
            border: 2px solid #fff;
            width: 50px;
            height: 50px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            color: #fff;
            background: rgba(255, 255, 255, 0.2);
            transition: transform 0.2s;
        }
        table.crossword td.highlight {
            background: #ffd700 !important;
            color: #000;
            transform: scale(1.1);
        }
        ul.word-list {
            margin-top: 20px;
            list-style: none;
            padding: 0;
            text-align: center;
        }
        ul.word-list li {
            background: rgba(255,255,255,0.2);
            padding: 10px;
            margin: 5px auto;
            width: 60%;
            border-radius: 8px;
            font-size: 18px;
        }
        .btn-group {
            margin-top: 25px;
            text-align: center;
        }
        .btn-custom {
            background: #ffd700;
            border: none;
            color: black;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 10px;
            margin: 5px;
            transition: all 0.3s;
        }
        .btn-custom:hover {
            background: #ffae00;
            transform: scale(1.05);
        }

        @keyframes fadeIn { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes fadeInGrid { from { opacity: 0; transform: scale(0.9); } to { opacity: 1; transform: scale(1); } }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
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

    <!-- Result Card -->

    <div class="card">
        <h2>✅ Crossword Generated </h2>

        <!-- Crossword Grid -->
        <div class="table-responsive">
            <%= request.getAttribute("crossword") %>
        </div>

        <!-- Found Word Locations -->
        <h4 class="mt-4 text-center">📍 Found Words & Locations</h4>
        <ul class="word-list">
            <% 
                java.util.List<String> foundInfo = (java.util.List<String>) request.getAttribute("foundInfo");
                if (foundInfo != null) {
                    for (String info : foundInfo) { 
            %>
                <li><%= info %></li>
            <% } } %>
        </ul>

        <!-- Buttons -->
        <div class="btn-group">
            <a href="generate.jsp" class="btn btn-custom">🛠 Generate New</a>
            <a href="solve.jsp" class="btn btn-custom">🔍 Solve Crossword </a>
            <a href="index.jsp" class="btn btn-custom">🏠 Home </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
