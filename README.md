# Flutter Articles App

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![HitCount](https://hits.dwyl.com/dipakp2726/articles_app.svg?style=flat-square&show=unique)](http://hits.dwyl.com/dipakp2726/articles_app)

A Flutter app that uses the "[dev.to](https://dev.to/api/)" api to fetch Articles and their info (
their metrics, images, ..etc)

## Previews

### Inifnite Scrolling

(Paginated list with Riverpod providers, [more information below](#infinite-scroll-functionality)
👇)


<div style="display: flex">
<img style="display: inline-block" src="" />

<img style="display: inline-block" src="" />
</div>

## App Architecture and Folder Structure

The code of the app implements clean architecture to separate the UI, domain and data layers with a
feature-first approach for folder structure.

#### Folder Structure

```
lib
├── core
│   ├── configs
│   ├── exceptions
│   ├── models
│   ├── services
│   │   ├── http
│   │   └── storage
│   └── widgets
├── features
│   ├── articles
│       ├── models
│       ├── providers
│       ├── repositories
│       └── views
│           ├── pages
│           └── widgets
│  
├── main.dart
└── articles_app.dart
```
