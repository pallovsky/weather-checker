
# Projekt i architektura aplikacji

## Tytuł aplikacji

Weather-checker

## Autor/Autorzy

- Krzysztof Pala, pala@student.agh.edu.pl


## Wykaz i kompetencje modułów

- klasa Weather – sluzy do przechowywania danych dotyczacych pogody na jeden dzien.


## Projekt interfejsu użytkownika

### Widok 1 – DailyView

#### Zadanie
Wyswietla dane dotyczace danej lokalizacji. Domyslnie jest to lokalizacja urzadzenia.

#### Powiązania z innymi widokami
- nazwa miasta: SearchCityView
- data: TemperatueChartView

### Widok 2 – SearchCityView

#### Zadanie
Umozliwia wyszukanie miasta, aby sprawdzic jego pogode. 

#### Powiązania z innymi widokami
- wyszukana nazwa miasta: DailyView

### Widok 3 - TemperatureChartView

#### Zadanie - wyswietla dane dotyczace pogody w danej lokalizacji na najblizsze 7 dni.

#### Powiązania z innymi widokami
- ikonka powrot: DailyView

## Scenariusze użycia

### Scenariusz 1 - sprawdzenie prognozowanej temperatury w obecnej lokalizacji

1. Uruchomienie aplikacji
2. DailyView - informacja o dzisiejszej pogodzie w automatycznie pobranej lokalizacji
3. Klikniecie daty
4. TemperatureChartView - informacja o pogodzie w ciagu 7 dni.

### Scenariusz 2 – sprawdzenie pogody w innej niz obecna lokalizacja

1. Uruchomienie aplikacji
2. DailyView - informacja o dzisiejszej pogodzie w automatycznie pobranej lokalizacji
3. Klikniecie w miasto
4. Wyszukanie docelowego miasta
5. Klikniecie w znalezione miasto
6. DailyView - informacja o dzisiejszej pogodzie w wybranym miescie
3. Klikniecie daty
4. TemperatureChartView - informacja o pogodzie w ciagu 7 dni.
