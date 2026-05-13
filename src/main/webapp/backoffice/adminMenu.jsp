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
                        <a href="createQuestions.jsp" class="list-group-item list-group-item-action">Créer des
                            questions</a>
                        <a href="../AdminAnswersServlet" class="list-group-item list-group-item-action">Voir les
                            réponses</a>
                        <a href="../index.jsp"
                            class="list-group-item list-group-item-action list-group-item-secondary">Retour au site</a>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h2>Menu Actuel</h2>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSushiModal">
                            + Ajouter un Sushi
                        </button>
                    </div>

                    <ul id="admin-menu-list" class="list-group">
                        <!-- Loaded via API -->
                    </ul>
                </div>
            </div>
        </div>

        <!-- Modal Ajout Sushi -->
        <div class="modal fade" id="addSushiModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Ajouter un Sushi</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addSushiForm">
                            <div class="mb-3">
                                <label class="form-label">Nom</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" name="description"></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Prix (€)</label>
                                <input type="number" step="0.01" class="form-control" name="price" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Enregistrer</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function loadMenu() {
                fetch('../api/menu')
                    .then(res => res.json())
                    .then(data => {
                        const list = document.getElementById('admin-menu-list');
                        list.innerHTML = "";
                        data.forEach(sushi => {
                            list.innerHTML += `
                            <li class="list-group-item d-flex justify-content-between align-items-center shadow-sm mb-2 rounded">
                                <div>
                                    <strong>${sushi.name}</strong><br>
                                    <small class="text-muted">${sushi.description || ''}</small>
                                </div>
                                <div class="d-flex align-items-center">
                                    <span class="badge bg-success rounded-pill me-3">${sushi.price.toFixed(2)} €</span>
                                    <button onclick="deleteSushi('${sushi.id}')" class="btn btn-sm btn-outline-danger">
                                        Supprimer
                                    </button>
                                </div>
                            </li>`;
                        });
                    })
                    .catch(e => console.error("API non disponible", e));
            }

            document.getElementById('addSushiForm').onsubmit = function (e) {
                e.preventDefault();
                const formData = new FormData(this);
                const params = new URLSearchParams();
                params.append('action', 'add');
                for (const pair of formData) {
                    params.append(pair[0], pair[1]);
                }

                fetch('../api/menu', {
                    method: 'POST',
                    body: params
                }).then(() => {
                    bootstrap.Modal.getInstance(document.getElementById('addSushiModal')).hide();
                    this.reset();
                    loadMenu();
                });
            };

            function deleteSushi(id) {
                if (!confirm('Supprimer ce sushi ?')) return;
                const params = new URLSearchParams();
                params.append('action', 'delete');
                params.append('id', id);

                fetch('../api/menu', {
                    method: 'POST',
                    body: params
                }).then(() => loadMenu());
            }

            loadMenu();
        </script>
    </body>

    </html>
