# tex-party-invites

tex-party-invites provides a template for DIN A6 party invites with
fancy qr codes.  

### Make your own party invites with TeX

#### 1. Write your invitation text in `einladung.tex`

```tex

\begin{document}

\renewcommand*{\adrentry}[8]{%
\begin{letter}{}
	\if#5m \opening{Lieber #2,} \fi
	\if#5w \opening{Liebe #2,} \fi

	wir möchten dich gerne zu unserer Feier anlässlich unseres
	\TeX-Test-Events am Samstag, den 19. September 2020 um 14 Uhr einladen.
	Zur besseren Organistation würden wir dich um Rückmeldung bis zum 16.
	September bitten.\\
	Kontaktdaten, sowie weitere Infos zur Feier findest du in den QR-Codes.

	\closing{Liebe Grüße}

\end{letter}
}
\input{gaeste.adr}

\end{document}
```

#### 2. Adjust the data provided in the qr codes in `qrcodes.tex`

Take care of _special characters_! Those need to be escaped properly with their decimal ASCII codes. Examples for germans umlauts are provided in `qrcodes.tex`.

#### 3. Curate your guest list in `gaeste.adr`

If you don't put anyone on your guest list, the party will be quite lame.  
So add some people in `gaeste.adr` using KOMAScripts `\adrentry` command.

For example:

```tex
\adrentry{Mustermann} % Nachname
 	 {Max} % Vorname
 	 {Franz-Josef-Strauß-Ring 1\\80539 München} % Adresse
	 {+49 89 1234 56 78 9} % Telefonnummer
 	 {m} % Extension-F1; hier Geschlecht: (m/w)
 	 {} % Extension-F2; keine Bedeutung
 	 {} % Kommentar
 	 {MM123} % Kürzel. Kann im addr-feld von scrletter verwendet werden
```

You can use the fields by `#` followed by their index in your invitation text. So you could get a more formal salutation like this:

```tex

	\if#5m \opening{Sehr geehrter Herr #2 #1,} \fi
	\if#5w \opening{Sehr geehrte Frau #2 #1,} \fi

```

#### 4. `make` your bulk invitations

The default target is `invites`.  
So `make` or `make invites` will generate your invitations as a bulk letter in DIN A6 format. If you can print those, you have a somewhat more advanced printer than most people do. _Congratulations!_

If you have a standard printer with standard DIN A4 sheets like i do, preposition your scissors and type `make merged` in your shell of choice. This will put magically a file called `printA4.pdf` in your working directory, which you can print as a standard DIN A4 sheet, containing 4 invites on a page with some handy auxiliary lines.

#### 5. Enjoy your party

