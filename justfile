build:
  @templ generate
  @go build -o cmd/main.go
  @just build-tailwind


build-tailwind:
    @echo "🎨 Building Tailwind CSS..."
    @pnpm exec tailwindcss -i static/css/index.css -o static/css/out.css --content "./components/**/*" --content "./pages/**/*" --content "./layouts/**/*"
    @if [ -f static/css/out.css ]; then \
        echo "📝 Generating CSS hash..."; \
        HASH=$(sha256sum static/css/out.css | cut -d' ' -f1 | head -c8); \
        echo "🔖 Hash: $HASH"; \
        rm -f static/css/out.*.css; \
        cp static/css/out.css static/css/out.$HASH.css; \
        echo "✅ Created static/css/out.$HASH.css"; \
    fi

tailwind:
  @pnpm exec tailwindcss -i static/css/index.css -o static/css/out.css --watch --content "./components/**/*" --content "./pages/**/*" --content "./layouts/**/*"

watch:
  air
