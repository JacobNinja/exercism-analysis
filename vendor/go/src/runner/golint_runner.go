package main

import "github.com/golang/lint"
import "os"
import "fmt"
import "io/ioutil"

func main() {
	filename := os.Args[1]
	src, err := ioutil.ReadFile(filename)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		return
	}
	l := new(lint.Linter)
	ps, err := l.Lint("-", src)
	if err != nil {
		return
	}
	for _, p := range ps {
		fmt.Printf("%s:%v: %s\n", filename, p.Position, p.Text)
	}
}
