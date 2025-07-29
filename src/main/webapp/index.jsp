<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>🧩 CrossMaster </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #1f4037, #99f2c8);
            font-family: 'Segoe UI', sans-serif;
            color: white;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .main-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
            width: 600px;
            animation: fadeIn 1s ease-in-out;
        }
        h1 {
            font-weight: 700;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.4);
        }
        p {
            font-size: 18px;
            margin-bottom: 30px;
        }
        .btn-custom {
            font-size: 20px;
            padding: 12px 20px;
            border-radius: 12px;
            transition: transform 0.2s ease-in-out;
        }
        .btn-custom:hover {
            transform: scale(1.08);
            box-shadow: 0 6px 15px rgba(0,0,0,0.4);
        }
        .btn-generate {
            background: #007bff;
            color: white;
            border: none;
        }
        .btn-solve {
            background: #28a745;
            color: white;
            border: none;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="main-card">
        <h1 class="mb-3">🧩 CrossMaster </h1>
        <p class="lead">Create and solve crosswords easily with a modern UI !</p>
        <div class="d-flex justify-content-center gap-3">
            <a href="generate.jsp" class="btn btn-custom btn-generate">🛠 Generate Crossword</a>
            <a href="solve.jsp" class="btn btn-custom btn-solve">🔍 Solve Crossword</a>
        </div>
    </div>
</body>
</html>
