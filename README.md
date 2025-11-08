# GhibiSwiftUI

A SwiftUI learning project that demonstrates building an iOS app using the Studio Ghibli API.

## About

This repository is for learning Swift and SwiftUI by following the YouTube tutorial:
[SwiftUI Tutorial](https://www.youtube.com/watch?v=xB6uf_Aqq9g&t=8503s)

The app showcases modern iOS development practices including:
- SwiftUI for declarative UI
- MVVM architecture
- Network layer with protocol-oriented design
- API integration with the Studio Ghibli API

## Project Structure

```
GhibiSwiftUi/
├── Models/
│   ├── Film.swift           # Film data model
│   └── People.swift         # People data model
├── Networking/
│   ├── Services/
│   │   ├── GhibliService.swift        # Service protocol
│   │   ├── DefaultGhibliService.swift # API implementation
│   │   └── MockGhibliService.swift    # Mock for testing
│   └── FilmsViewModel.swift           # View model for films
├── Views/
│   └── FilmListView.swift   # Film list UI
├── ContentView.swift        # Main content view
└── GhibiSwiftUiApp.swift   # App entry point
```

## Features

- Fetch and display Studio Ghibli films
- Clean architecture with separation of concerns
- Protocol-oriented networking layer
- Support for testing with mock services

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Getting Started

1. Clone the repository
```bash
git clone <repository-url>
```

2. Open the project in Xcode
```bash
open GhibiSwiftUi.xcodeproj
```

3. Build and run the project (⌘ + R)

## API

This project uses the [Studio Ghibli API](https://ghibliapi.vercel.app/) to fetch data about Studio Ghibli films and characters.

## Learning Goals

- Understanding SwiftUI basics
- Building network layers in Swift
- Implementing MVVM architecture
- Working with REST APIs
- Protocol-oriented programming
- Async/await for asynchronous operations

## License

This project is for educational purposes only.
