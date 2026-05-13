<%@ page contentType="text/html;charset=UTF-8" %>
<%
int nbQuestions = Integer.parseInt(request.getParameter("nbQuestions"));
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saisie des Questions - Love Sushi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Administration - Saisir les questions</h1>
        <hr>
        <div class="row">
            <div class="col-md-4">
                <div class="list-group">
                    <a href="adminMenu.jsp" class="list-group-item list-group-item-action">Gérer le Menu</a>
                    <a href="createQuestions.jsp" class="list-group-item list-group-item-action active">Créer des questions</a>
                    <a href="../AdminAnswersServlet" class="list-group-item list-group-item-action">Voir les réponses</a>
                    <a href="../index.jsp" class="list-group-item list-group-item-action list-group-item-secondary">Retour au site</a>
                </div>
            </div>
            <div class="col-md-8">
                <form action="../CreateQuestionsServlet" method="post" class="card p-4">
                    <% for (int i = 0; i < nbQuestions; i++) { %>
                        <div class="mb-4">
                            <h4>Question <%= i + 1 %></h4>
                            <div class="mb-2">
                                <input type="text" name="question" class="form-control" placeholder="Entrez la question..." required>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <input type="text" name="choix1" class="form-control" placeholder="Choix 1" required>
                                </div>
                                <div class="col">
                                    <input type="text" name="choix2" class="form-control" placeholder="Choix 2" required>
                                </div>
                            </div>
                        </div>
                        <% if (i < nbQuestions - 1) { %><hr><% } %>
                    <% } %>
                    <button type="submit" class="btn btn-success mt-3">Enregistrer les questions</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
