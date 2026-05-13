<%@ page import="java.util.List" %>
<%@ page import="fr.ubdx.net.model.Question" %>
<%
List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sondage - Love Sushi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .sushi-card { border-radius: 15px; border-top: 5px solid #fd7e14; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card sushi-card p-4">
                    <h2 class="text-center mb-4">Mieux vous connaitre 🥢</h2>
                    
                    <% if (questions == null || questions.isEmpty()) { %>
                        <div class="text-center">
                            <div class="alert alert-info">Aucune question n'est disponible pour le moment.</div>
                            <a href="index.jsp" class="btn btn-secondary mt-3">Retour à l'accueil</a>
                        </div>
                    <% } else { %>
                        <form action="SubmitAnswersServlet" method="post">
                            <div class="mb-4">
                                <label class="form-label fw-bold">Votre pseudo ou ID :</label>
                                <input type="text" name="utilisateur_id" class="form-control" placeholder="Ex: amaryllis_fan" required>
                            </div>
                            
                            <% for (int i = 0; i < questions.size(); i++) { 
                                Question q = questions.get(i);
                            %>
                                <div class="mb-4 p-3 bg-white border rounded">
                                    <p class="fw-bold mb-2"><%= i + 1 %>. <%= q.getQuestion() %></p>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="q<%= i %>" id="q<%= i %>_1" value="<%= q.getChoix1() %>" required>
                                        <label class="form-check-label" for="q<%= i %>_1">
                                            <%= q.getChoix1() %>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="q<%= i %>" id="q<%= i %>_2" value="<%= q.getChoix2() %>">
                                        <label class="form-check-label" for="q<%= i %>_2">
                                            <%= q.getChoix2() %>
                                        </label>
                                    </div>
                                </div>
                            <% } %>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-warning btn-lg text-white">Envoyer mes réponses 🍱</button>
                                <a href="index.jsp" class="btn btn-outline-secondary">Annuler</a>
                            </div>
                        </form>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
