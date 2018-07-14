package main

import (
	"net/http"
	"log"
	"os"
	"strconv"
	"fmt"
)

func main() {
	port := 8080
	if len(os.Args) > 1 {
		p, err := strconv.Atoi(os.Args[1])
		if err != nil {
			log.Fatal(err)
			os.Exit(-1)
		}
		port = p
	}

	http.HandleFunc("/", helloHandler)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", port), nil))
}

func helloHandler(w http.ResponseWriter, _ *http.Request) {
	w.Write([]byte("hello world!"))
}