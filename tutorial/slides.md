---
marp: true
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
---

![bg left:40% 80%](logo.svg)

# **OpenSCAD**

Ein OpenSCAD Basis Tutorial von Peter Recktenwald 

https://www.berlincreators.de

---

![bg left:40% 80%](Openscad.svg)

# Was ist OpenSCAD?

OpenSCAD ist eine freie Software um 3D CAD Objekte zu designen. Im Gegensatz zu vielen anderen CAD Programmen werden in OpenSCAD die 3D Objekte mit einer textbasierten Skriptsprache erstellt.
Die Objekte bestehen aus einfachen Grundkörpern die zu komplexen 3D Modellen kombiniert werden. 

---

# Was wird benötigt?

* OpenSCAD http://openscad.org/downloads.html
* Basis Tutorial https://github.com/robotfreak/badge-creator
* FontAwesome brand und free Font https://github.com/FortAwesome/Font-Awesome
* Baumans Font https://www.1001fonts.com/baumans-font.html

---

# Installation

OpenSCAD läuft auf Linux, Mac und Windows Platformen (auch auf dem Raspberry Pi, siehe https://github.com/koendv/openscad-raspberrypi/releases). 

Das Basis Tutorial kann als Zip Datei heruntergeladen werden und in einem beliebigen Ordner ausgepackt werden. 

Die Fonts werden je nach OS entsprechend installiert und stehen dann unter OpenSCAD zur Verfügung.

---

# Los geht's mit dem Customizer 

Anfangen wollen wir mit dem Customizer. Da sich OpenSCAD Modelle sehr gut parametrisieren lassen ist dies ein einfacher Einstieg, der ohne Programmierkenntnisse auskommt.

Dazu öffnen wir OpenSCAD  und laden das Skript badge-creator.scad aus dem Basis Tutorial Ordner.

Den Editor links im Bild schliessen wir zunächst (klick auf das x). Statt dessen benötigen wir den Customizer (Im Menü 'Windows' den Haken vor 'Hide customizer' entfernen).

---

![width:1000px](openscad1.png)

---

# Navigation in der Vorschau

Die Vorschau des Modells kann mit dem Scrollrad der Maus vergrößert/verkleinert werden.

Bei gedrückter linker Maustaste lässt sich das Modell in den Raumachsen bewegen.

Bei gedrückter rechter Maustaste lässt sich die Kameraposition, der Blick auf das Modell, ändern.

Zudem gibt es eine Iconleiste unter dem Vorschau Fenster, um die Ansicht zu ändern. 

---

# Der Customizer

Über den Customizer lassen sich Parameter des Modells ändern, sofern der Schöpfer des Modells dies vorgesehen hat. 

In unserem Beispiel, dem badge-creator können die globalen Parameter u.a Form, Breite und Höhe des Badge, sowie der Text, Position, Font und Fontgröße für maximal 4 Textzeilen geändert werden. Zudem kann ein beliebiges SVG Logo oder ein QR Code platziert werden.

Damit lassen sich Badges für viele Anwendungszwecke individuell anpassen, ohne auch nur einzige Zeile zu programmieren.   

---

# globale Einstellungen

Zu den globalen Einstellungen zählen:
* die Form des Badge (rund, eckig oder ein SVG Bild),
* Die Abmessungen, 
* die Rundung der Ecken (bei der eckigen Form),
* Um welche Höhe der Text erhoben ist,
* Ob der Text in die Höhe ragt oder nach unten (Gravur), 
* ein Loch für Schlüsselanhänger 
* oder Vertiefungen für Magnete (zum Einkleben)

---

# Text Einstellungen

Jede der 4 Textzeile kann:
* der anzuzeigende Text,
* der verwendete Font,
* die Fontgröße,
* die Position auf dem Badge,

Als Sonderfall können auch Icons dargestellt werden, z.B aus dem FontAwesome Brand oder Free Font. 

---

# Logo Einstellungen

Das Logo kann ebenso frei positioniert und in der Größe skaliert werden. Das SVG File muss im selben Ordner liegen wie das Skript.

ALs Logo kann auch ein QR Code eingebunden werden. Dieser kann online unter https://ridercz.github.io/OpenSCAD-QR/ erzeugt werden. Die Daten unter qr_data werden dann per copy & paste an die entsprechende Stelle in der Datei qrcode.scad eingefügt. 

---

# 1. Übung

Als erste Übung könnt ihr ein persönliches Badge erstellen, z.B. ein Namens-Schild, einen Schlüsselanhänger oder einen Chip für Einkaufswagen.

![width:300px](berlin-creator-keychain.png) ![width:300px](berlin-creator-qrcode.png) ![width:300px](bulb-coin.png)

---

# OpenSCAD Programmierung

Kommen wir zum eigentlichen Thema die Programmierung von SCAD. Die Befehlsübersicht findet man unter dem Menüpunkt 'Help | Cheat Sheet'. Dahinter verbirgt sich ein Link auf: https://openscad.org/cheatsheet/

---

# 3D Grundkörper

Anfangen wollen wir mit den 3D Grundkörper. Davon gibt es nur ein paar wenige:
* Kugel (sphere)
* Zylinder (cylinder)
* Würfel (cube)
* Polyeder (polyhedron)

---

# Positionieren von Objekten

Zum Positionieren eines 3D Objektes im 3 dimensionalen Raum gibt es die beiden Befehle:
* translate - zum Positionieren des Objekts in x,y, und z-Richtung
* rotate - zum Drehen eines Objektes um die x, y, oder z-Achse. Die Parameter werden jeweils in eckigen Klammern mit Komma getrennt angegeben, so verschiebt z.B. der folgende Befehle 
translate([10,20,30]) cube(10);
einen Würfel um 10mm in x-Richtung, 20mm in y-Richtung und 30mm in z-Richtung

---

# 2. Übung

Mit den bisher vorgestellten Befehlen lässt sich bereits einges anfangen. Als Übung soll eine aus Grundkörpern zusammengesetze Figur oder Gegenstand erstellt werden, z.B. ein Tier oder oder ein Haus.

