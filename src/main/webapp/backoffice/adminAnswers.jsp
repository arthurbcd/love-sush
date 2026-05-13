<%@ page import="java.util.List" %>
<%@ page import="fr.ubdx.net.model.Question" %>
<%@ page import="fr.ubdx.net.model.Answer" %>

<%
List<Question> questions = (List<Question>) request.getAttribute("questions");
List<Answer> answers = (List<Answer>) request.getAttribute("answers");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réponses des Utilisateurs - Love Sushi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Administration - Réponses</h1>
        <hr>
        <div class="row">
            <div class="col-md-4">
                <div class="list-group">
                    <a href="backoffice/adminMenu.jsp" class="list-group-item list-group-item-action">Gérer le Menu</a>
                    <a href="backoffice/createQuestions.jsp" class="list-group-item list-group-item-action">Créer des questions</a>
                    <a href="AdminAnswersServlet" class="list-group-item list-group-item-action active">Voir les réponses</a>
                    <a href="index.jsp" class="list-group-item list-group-item-action list-group-item-secondary">Retour au site</a>
                </div>
            </div>
            <div class="col-md-8">
                <% if(answers == null || answers.isEmpty()) { %>
                    <div class="alert alert-warning">Aucune réponse pour le moment.</div>
                <% } else { %>
                    <div class="accordion" id="accordionAnswers">
                    <% for (int i = 0; i < answers.size(); i++) { 
                        Answer answer = answers.get(i);
                    %>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading<%= i %>">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= i %>" aria-expanded="false" aria-controls="collapse<%= i %>">
                                    Utilisateur : <%= answer.getUtilisateurId() %>
                                </button>
                            </h2>
                            <div id="collapse<%= i %>" class="accordion-collapse collapse" aria-labelledby="heading<%= i %>" data-bs-parent="#accordionAnswers">
                                <div class="accordion-body">
                                    <ul class="list-group list-group-flush">
                                        <% for (int j = 0; j < answer.getReponses().size(); j++) { %>
                                            <li class="list-group-item">
                                                <strong><%= (questions != null && j < questions.size()) ? questions.get(j).getQuestion() : "Question" %></strong>
                                                <br> <%= answer.getReponses().get(j) %>
                                            </li>
                                        <% } %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    <% } %>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
