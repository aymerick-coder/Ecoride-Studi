<!-- resources/views/avis/create.blade.php -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>TEST</title>
</head>
<body>
    <h1>Ajouter un avis</h1>
<form action="/ecoride-v2/public/avis" method="POST">
        @csrf

        <label>Trajet (ex : Valence - Nîmes) :
            <input type="text" name="trajet" required>
        </label><br>
        <label>Passager :
            <input type="text" name="passager_id" required>
        </label><br>
        <label>Conducteur :
            <input type="text" name="conducteur_id" required>
        </label><br>
        <label>Note (1-5) :
            <input type="number" name="note" min="1" max="5" required>
        </label><br>
        <label>Commentaire :
            <textarea name="commentaire"></textarea>
        </label><br>
        <label>Statut :
            <select name="statut_avis">
                <option value="en_attente">En attente</option>
                <option value="approuve">Approuvé</option>
                <option value="rejete">Rejeté</option>
            </select>
        </label><br>
        <label>Date de création :
            <input type="datetime-local" name="date_creation">
        </label><br>
        <button type="submit">Ajouter l'avis</button>
    </form>
</body>
</html>
