package main

import (
	"encoding/json"
	"fmt"
	"github.com/shkh/lastfm-go/lastfm"
	"math/rand"
	"net/http"
	"strconv"
	"time"
)

type Artist struct {
	Name      string `json:"name"`
	Url       string `json:"url"`
	PlayCount int    `json:"count"`
	Mbid      string `json:"-"`
	Image     string `json:"image"`
}

var api = lastfm.New("c29e5238888b890632d2611d52d89e1e", "5af64c83988f5fb8e81cc65289b89cf2")

// func main() {
// 	json := getResponse()
// 	fmt.Println(string(json))
// }

func getResponse() []byte {
	result, _ := api.User.GetTopArtists(lastfm.P{"user": "gabek", "period": "1month", "limit": 20})
	var response []Artist

	var artists []Artist

	for _, artist := range result.Artists {
		// fmt.Printf("%+v\n", artist)

		playcount, _ := strconv.Atoi(artist.PlayCount)
		var image string

		if artist.Mbid != "" && playcount > 5 {
			for _, singleImage := range artist.Images {
				if singleImage.Size == "large" {
					image = singleImage.Url
				}
			}
			artists = append(artists, Artist{artist.Name, artist.Url, playcount, artist.Mbid, image})
		}
	}

	for _, artist := range artists {
		if artist.Mbid == "" || artist.PlayCount < 5 {
			continue
		}

		response = append(response, artist)
	}

	if len(response) < 20 {
		startIndex := len(response)
		newSlice := shuffle(artists[startIndex:])
		for _, artist := range newSlice {
			response = append(response, artist)
			if len(response) >= 20 {
				break
			}
		}
	}

	json, _ := json.Marshal(response)
	return json
}

func Handler(w http.ResponseWriter, r *http.Request) {
	enableCors(&w)
	json := getResponse()
	fmt.Fprintf(w, string(json))
}

func shuffle(vals []Artist) []Artist {
	r := rand.New(rand.NewSource(time.Now().Unix()))
	// We start at the end of the slice, inserting our random
	// values one at a time.
	for n := len(vals); n > 0; n-- {
		randIndex := r.Intn(n)
		// We swap the value at index n-1 and the random index
		// to move our randomly chosen value to the end of the
		// slice, and to move the value that was at n-1 into our
		// unshuffled portion of the slice.
		vals[n-1], vals[randIndex] = vals[randIndex], vals[n-1]
	}
	return vals
}

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
}
