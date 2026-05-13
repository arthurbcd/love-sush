<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Love Sushi - Front</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Bienvenue chez Love Sushi 🍣</h1>
            <span class="badge bg-secondary">v1.0.1</span>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-6">
                <h2>Notre Carte</h2>
                <ul id="menu-list" class="list-group">
                    <!-- Loaded via API -->
                </ul>
            </div>
            <div class="col-md-6">
                <h2>Réserver une table</h2>
                <form action="api/reservation" method="POST">
                    <div class="mb-3">
                        <label>Nom</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Date et Heure</label>
                        <input type="datetime-local" name="datetime" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Nombre de personnes</label>
                        <input type="number" name="people" class="form-control" min="1" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Réserver</button>
                    <a href="QuestionsServlet" class="btn btn-info mt-2">Mes préférences (Questions)</a>
                </form>
            </div>
        </div>
        <div class="mt-4 text-center">
            <a href="backoffice/createQuestions.jsp" class="btn btn-secondary">Accès Back-office</a>
        </div>
    </div>

    <script>
        fetch('api/menu')
            .then(res => res.json())
            .then(data => {
                const list = document.getElementById('menu-list');
                data.forEach(sushi => {
                    list.innerHTML += `<li class="list-group-item d-flex justify-content-between align-items-center">
                        ${sushi.name}
                        <span class="badge bg-success rounded-pill">${sushi.price} €</span>
                    </li>`;
                });
            })
            .catch(e => console.error("API non disponible", e));
    </script>
</body>
</html>