build:
  @templ generate
  @go build -o datastarui main.go
  @just build-tailwind
