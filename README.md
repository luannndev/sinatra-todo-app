# 📝 Sinatra Task Manager

Ein einfaches, aber leistungsfähiges **Task-Management-System**, das mit **Sinatra** und **Ruby** erstellt wurde. Verwalte deine Aufgaben effizient, setze Prioritäten und organisiere deine To-Dos mit Leichtigkeit. Dieses Projekt beinhaltet Benutzerauthentifizierung, Aufgabenmanagement und eine übersichtliche Benutzeroberfläche!

## 🚀 Features

- **Benutzerregistrierung und -anmeldung**: Sicheres Anmelden und Erstellen von Benutzersitzungen.
- **Aufgaben hinzufügen, bearbeiten und löschen**: Einfache Verwaltung deiner Aufgaben.
- **Prioritätensystem**: Füge deinen Aufgaben eine Priorität hinzu, um deine wichtigsten Aufgaben zuerst zu sehen.
- **Tagging-System**: Füge Tags hinzu, um Aufgaben zu kategorisieren.

## 🛠️ Installation & Setup

### Voraussetzungen

Bevor du startest, stelle sicher, dass du folgendes installiert hast:

- **Ruby** (getestet mit Version 3.3.0)
- **Bundler** (zum Installieren der Abhängigkeiten)

### Installationsschritte

1. **Repository klonen**

   ```bash
   git clone https://github.com/luannndev/sinatra-todo-app.git
   cd sinatra-todo-app
   ```

2. **Abhängigkeiten installieren**

   ```bash
   bundle install
   ```
   
3. **Server starten**

   ```bash
   ruby app.rb
   ```

### Der Server läuft nun unter http://localhost:4567.

## 📦 Usage

- **Registrieren oder Anmelden**: Gehe zur `/signup` oder `/login` Seite, um ein Benutzerkonto zu erstellen oder dich anzumelden.
- **Aufgaben erstellen**: Gib Titel, Beschreibung, Fälligkeitsdatum, Priorität und Tags ein, um eine neue Aufgabe zu erstellen.
- **Aufgaben priorisieren**: Ordne deine Aufgaben nach Priorität und verwalte deine wichtigsten Aufgaben auf der `/priorities` Seite.
- **Aufgaben bearbeiten und löschen**: Ändere oder entferne Aufgaben direkt in der Liste.
- **Sortieren nach Prioritäten**: Verwende die `/priorities` Route, um die Aufgaben nach ihrer Wichtigkeit zu sortieren.

## 🧪 Testing

- Du kannst die Anwendung mit verschiedenen Benutzern testen, um sicherzustellen, dass jede Sitzung unabhängig ist.
- Füge mehrere Aufgaben mit verschiedenen Prioritäten hinzu und teste die Sortierfunktion.
- Überprüfe, ob das Tagging korrekt funktioniert, indem du Tags hinzufügst und nach ihnen suchst.

## 🤝 Mitwirken

- Fork das Repository
- Erstelle einen neuen Feature-Branch (`git checkout -b feature/neues-feature`)
- Committe deine Änderungen (`git commit -m 'Neues Feature hinzugefügt'`)
- Push die Änderungen (`git push origin feature/neues-feature`)
- Eröffne einen Pull Request

   
