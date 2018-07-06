# Status OBC Software (und HW)

## Was hat sich seit dem letzten Meeting getan:

 * keine konkreten Fortschritte in SW und/oder Dokumentation.
 * vorige Woche - heute; "Team building" -> OBC SW Entwicklerteam (6 Personen - Andi, Harry, Margit, Reinhard, Robert, Sebastian) - Herbert f. Testkonzepte/TestHw ?
 * CubeSim als Source code zur Verfügung (-> 'Missions'-Simulator?, Testdaten Generator!?).
 
## Abhängigkeiten von Anderen:

* OBC Hardware erst finalisierbar, wenn System/Konzeptentscheidungen abgesichert sind:
  * Power Konzept -> Bus/Steckerbelegung finalisiert.
  * ADCS Entscheidung -> weniger Sensoren und damit SPI/I2C notwendig, RS485, Bus/Steckerbelegung
  * Propulsion -> RS485, Bus/Steckerbelegung
  * Alle anderen GPIOs gegen alle Submodule ckecken, Schaltbare Power Supplies, Resets, ...  -> Bus/Steckerbelegung
  * Requirenments aus der Mission absichern:
	* RadHard Image sollte erreicht werden (MPU wie PEG vs. Bootloader)! 
    * Flash Speicher (2x ) ausreichend? Gibt es Missionsanforderungen an die Speichergröße! (Derzeitiges Bild: HKD, -Picture, -Science, +SystemHealth&Events, Subsystem Images!?)
    * RTC notwendige Auflösung & Genauigkeit. (LPC interne RTC "tickt nur in Sekunden", mehr Auflösung mit SW Tricks -> Komplexität, Kalibrierung und Tests notwendig!)
* OBC-STACIE-GS Kommunikation spezifizieren
  * Änderungen am UART Protokoll OBC-STACIE (ACk/Nack, Speed&Delays, Comm <-> SystemMonitoring&HKD)
  * Active/Standby Konzept (A/C) überarbeiten/redesignen
  * OBC-GS Application Layer Transparenz ermöglichen (OBC-GS != OBC-STACIE)
* OBC-EPU Schnittstelle spezifizieren
  * Überarbeiten der I2C Register/Befehle/System Health(&Event Konzept?)
* Propulsion Schnittstelle
  * Funktionales Design
  * Testkonzepte / Simulatoren & Stubbing
* ADCS Schnittstelle
  * Funktionales Design
  * Testkonzepte / Simulatoren & Stubbing
* Test Hardware so früh wie möglich [Konzepte aus OBC Sicht](https://github.com/carstenscharlemann/Climb-Obc-Sandbox/blob/master/mddocs/obcarc42/TestConcepts.md)
  * OBC für Software entwickler 5..10 Stück
  * Bus Adapter mit herausgeführten UARTs (eventuell mit FTDI on board?), JTAG Programmer
	*  Variante 1 20..40 Stk: OBC Only 1xBuchse(2x20 2mm) für X+,X-,Y+,Y- => Jumper, Stecker mit 2.54mm  
	*  Variante 2 ??8/12Stk??: Busplatine für 2 - 3 Einheiten ("MiniStack") wobei die UARTS Extern/Connected zu jaumpoern sind..... 
  
## Abhängigkeiten zu Anderen:

* Erreichbare Genauigkeit der RTC durch Kalibrierungen & Tests absichern.
* OBC-STACIE Kommunikation spezifizieren (s.o.)
* Roadmap/Planung OBC Entwicklung mit zeitlichen Abhängigkeiten. "Wann brauchen wir was und wie viel davon?"
* Ansprechpartner und 'Stellvertreter' für Alles&einzelne Themengebiete definieren. (Alles - ADCS - Comm - Propulsion - ...)

## Aktuelle (an)laufende Tasks

* Software Architekturdokument([Arc42](Arc42Intro.md)) Erstentwurf -> [als lebendes Dokument etablieren](https://github.com/carstenscharlemann/Climb-Obc-Sandbox/blob/master/mddocs/obcarc42/TheArchitectur.md).
* "Space Proofed Bootloader": Konzepte und Detailded Design -> Erste Versuche und Versionen auch noch ohne OBC HW möglich (-> Einfluss auf HW Design! -MPU, +Radhard Memory)
* new/reworked Storage (Logger). "Make it more robust" (Eventuell 2 Level -> SaveStore(Skripts, HKD) vs. MassStore(Events & other data) ...)
* Etablieren der Entwickler Vorgehensweisen "Vom Quatschen zum Doing!" -> github way of doing repositories/projects/issues zum Leben erwecken.

## Roadmap OBC Software
* 0.1 Version für OBC Software mit aktuellem FreeRTOS auf 'leerem' Entwicklerboard. (ohne C++) (Teile/Submodule können ab dann mit Entwicklerboard + HW Prototypes 'gebastelt' werden).
* 0.2 Version mit Bootloader (oder Alternative!?) und HW Layer nach Schaltplan. (Teile/Submodule können ab dann mit Entwicklerboard + HW Prototypes 'gebastelt' werden).
* 0.3 **Version läuft auf echter OBC Hardware inclusive low level SystemHealth/BoardTest Routinen.**
* 0.4 Version + EPU Ansteuerung
* 0.5 Version + Storage APIs
* 0.6 Version + STACIE Comm & OG Communication (first Commands only ;-))
###
* 0.a1	Mixin (ab 0.3) Propulsion Module (Ansteuerung Subsystem, + 1. Version MC-API)
* 0.a2	Mixin (ab 0.3) ADCS Module (Ansteuerung Subsystem, + 1. Version MC-API)
###
* 0.b1  Mixin (ab 0.5) Housekeeping & SystemStatus/Eventstore
* 0.b2  Mixin (ab 0.6) 1. Version Scripting Engine (-> Zeitgesteuert Commands)
###
* 0.7 Version + Mission Control 1.Version mit 'Mission State Diagram' -> Operational Modes....
* 0.99 "OBC Software proof of Architectural Frame" -> Alle Module vorhanden aber nur Erst und Basisfunktionalität!!! Lange nicht "Feature Ready"
###
* 1.c1 Mixin (ab 1.0) + Subsystem Image Recovery
* ... 				  + Alles was wir jetzt noch vergessen haben ;-).
