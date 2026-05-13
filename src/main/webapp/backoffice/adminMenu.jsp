<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Back-office - Love Sushi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Administration Love Sushi</h1>
        <hr>
        <div class="row">
            <div class="col-md-4">
                <div class="list-group">
                    <a href="adminMenu.jsp" class="list-group-item list-group-item-action active">Gérer le Menu</a>
                    <a href="createQuestions.jsp" class="list-group-item list-group-item-action">Créer des questions</a>
                    <a href="../AdminAnswersServlet" class="list-group-item list-group-item-action">Voir les réponses</a>
                    <a href="../index.jsp" class="list-group-item list-group-item-action list-group-item-secondary">Retour au site</a>
                </div>
            </div>
            <div class="col-md-8">
                <h2>Menu Actuel</h2>
                <div class="alert alert-info">Fonctionnalité d'ajout et de suppression à relier avec l'API. (En cours de dev)</div>
                <ul id="admin-menu-list" class="list-group">
                    <!-- Loaded via API -->
                </ul>
            </div>
        </div>
    </div>
    <script>
        fetch('../api/menu')
            .then(res => res.json())
            .then(data => {
                const list = document.getElementById('admin-menu-list');
                data.forEach(sushi => {
                    list.innerHTML += `<li class="list-group-item d-flex justify-content-between align-items-center">
                        ${sushi.name} - ${sushi.description}
                        <div>
                            <span class="badge bg-success rounded-pill me-2">${sushi.price} €</span>
                            <button class="btn btn-sm btn-danger">Supprimer</button>
                        </div>
                    </li>`;
                });
            })
            .catch(e => console.error("API non disponible", e));
    </script>
</body>
</html>