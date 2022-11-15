# Specyfikacja realizowanej aplikacji

## Tytuł aplikacji

Weather-checker

## Autor/Autorzy

Krzysztof Pala, pala@student.agh.edu.pl

## Wizja aplikacji

Alikacja pozwala na sprawdzenie prognozy pogody na najblizsze dni. Glowna funkcja jest wyswietlanie danych z obecnej lokalizacji, jednak mozliwe tez jest przegladanie danych dla wyszukanego miasta. 

## Wymagania

- Mozliwosc przegladania pogody dla automatycznie wykrytej lokalizacji na najblizsze 7 dni
- Mozliwosc przegladania pogody dla wyszukanego miasta na nablizsze 7 dni

## Wykorzystane narzędzia

### Framework(i) iOS SDK
- Core Location
- Core Text
- Foundation

### Frameworki/biblioteki zewnętrzne

1. Alamofire (HTTP requests framework) -> https://github.com/Alamofire/Alamofire
2. Charts (rysowanie wykresow) -> https://github.com/danielgindi/Charts

## Dane

Dane pogodowe (dotyczace jednego dnia):
- lokalizacja prognozy
- data prognozy
- prognozowana temperatura
- prognozowany krotki opis pogody
- prognozowana predkosc wiatru
- prognozowana

Ze wzgledu na stosunkowo mala ilosc danych beda one pobierane przy kazdorazowym wlaczeniu aplikacji.

## Repozytorium

https://github.com/pallovsky/weather-checker
