# Replace Transformer

A simple search and replace transformer for [Dart](http://dartlang.org) pub deployments.

## Usage

Add to your list of dependencies in `pubspec.yaml`:

```yaml
name: my_project
dependencies:
  polymer: any
  replace_transformer: any
transformers:
- polymer:
    entry_points: web/index.html
- replace_transformer:
    file: web/index.html
    match: '<h1>Hello</h1>'
    replace: '<h2>Hello</h2>'
```

## TODO

This is a simple string replacement. It would be nice to match regualar expressions and to use them in replace portion of the `replaceAll()`.
