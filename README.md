# SmartCite
SmartCite

Definition of Done:  
- Vaatimus on analysoitu, suunniteltu, ohjelmoitu, testattu, testaus automatisoitu, dokumentoitu, integroitu muuhun ohjelmistoon ja viety tuotantoympäristöön.

Backlog: 
https://docs.google.com/spreadsheets/d/1wmKJn92xzplfzJKrfDkUWur9-Hx96e_3TWNF-Ajup8c/edit?usp=sharing

## Käynnistysohjeet

Kloonaa repositorio komennolla:
```
git clone
```


Siiry projektin juurihakemistoon.

Luo .env tiedosto ja luo sen sisällöksi:
```
DATABASE_URL=postgresql://XXXX
TEST_ENV=true
SECRET_KEY=XXXXX
```


Asenna projektin riippuvuudet komennolla:
```
poetry install
```


Siirry virtuaaliympäristöön komennolla:
```
poetry shell
```


Alusta projektin tietokanta:
```
python src/db_helper.py
```

Käynnistä ohjelma:
```
python src/index.py
```

