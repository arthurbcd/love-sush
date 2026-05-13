<%@ page contentType="text/html;charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Créer des Questions</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <div class="container mt-5">
            <h1>Administration - Créer des questions</h1>
            <hr>
            <div class="row">
                <div class="col-md-4">
                    <div class="list-group">
                        <a href="adminMenu.jsp" class="list-group-item list-group-item-action">Gérer le Menu</a>
                        <a href="createQuestions.jsp" class="list-group-item list-group-item-action active">Créer des
                            questions</a>
                        <a href="../AdminAnswersServlet" class="list-group-item list-group-item-action">Voir les
                            réponses</a>
                        <a href="../index.jsp"
                            class="list-group-item list-group-item-action list-group-item-secondary">Retour au site</a>
                    </div>
                </div>
                <div class="col-md-8">
                    <form action="generateQuestions.jsp" method="post" class="card p-4">
                        <div class="mb-3">
                            <label class="form-label">Nombre de questions :</label>
                            <input type="number" name="nbQuestions" class="form-control" min="1" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Continuer</button>
                    </form>
                </div>
            </div>
        </div>
    </body>

    </html>
