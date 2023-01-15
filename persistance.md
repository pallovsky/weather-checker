# Projekt i architektura aplikacji

## Tytuł aplikacji

Weather-checker

## Autor/Autorzy

- Krzysztof Pala, pala@student.agh.edu.pl


## Wybrane rozwiązanie

Charakterystyka aplikacji sprawia, że przechowywanie danych jest zbędne - wszystkie dane muszą być aktualne. Z tego powodu nie została zaimplementowana persystencja w projekcie:
- przechowywanie stanu pogody nie jes pożądane, ponieważ ważna jest jak najdokładniejsza i najaktualniejsza informacja.
- przechowywanie lokalizacji także nie jest potrzebne, ponieważ z założenia aplikacja ma pobierać aktulne położenie i nie wyswietlać danych dla poprzedniej lokalizacji. 
