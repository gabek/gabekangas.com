package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

type APIResponse struct {
	ResultsPage ResultsPage `json:"resultsPage"`
}

type ResultsPage struct {
	Results Results `json:"results"`
	Status  string  `json:"status"`
}

type Results struct {
	CalendaryEntries []CalendaryEntry `json:"calendarEntry"`
}

type CalendaryEntry struct {
	Reason  Reason  `json:"reason"`
	Concert Concert `json:"event"`
}

type Reason struct {
	Attendance string `json:"attendance"`
}

type Starts struct {
	DateTime string `json:"datetime"`
}

type Concert struct {
	Name      string `json:"displayName"`
	Url       string `json:"uri"`
	PlayCount int    `json:"count"`
	Status    string `json:"status"`
	Image     string `json:"image"`
	Date      Starts `json:"start"`
}

type Concerts struct {
	Concerts []ResponseConcert `json:"concerts"`
}

type ResponseConcert struct {
	Name string `json:"name"`
	Url  string `json:"url"`
}

// func main() {
// 	json := getResponse()
// 	fmt.Println(string(json))
// }

func getResponse() []byte {
	url := "https://api.songkick.com/api/3.0/users/gabek/calendar.json?reason=attendance&apikey=I4jI54VNlkJNZzub"
	//Get from URL
	res, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		log.Fatal(err)
	}

	response := APIResponse{}
	jsonErr := json.Unmarshal(body, &response)
	if jsonErr != nil {
		log.Fatal(jsonErr)
	}

	var result = Concerts{Concerts: []ResponseConcert{}}
	for _, entry := range response.ResultsPage.Results.CalendaryEntries {
		if entry.Concert.Status != "cancelled" {
			result.Concerts = append(result.Concerts, ResponseConcert{Name: entry.Concert.Name, Url: entry.Concert.Url})
		}
	}

	json, _ := json.Marshal(result)
	return json

}

func Handler(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	json := getResponse()
	fmt.Fprintf(w, string(json))
}

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
}
