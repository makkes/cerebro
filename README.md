# Cerebro - My Personal Knowledge Collection

This is my personal wiki-like collection of information on various topics. The resulting site is hosted at [cerebro.e13.dev](https://cerebro.e13.dev).

## Running Locally

Run

```
make serve-local
```

to run the site locally and view it in a browser.

## Updating the live Site

A [GitHub Actions workflow](./.github/workflows/build-image.yml) keeps building and pushing [a container image](https://github.com/makkes/cerebro/pkgs/container/cerebro) with the site's content upon every new commit pushed to the `main` branch.