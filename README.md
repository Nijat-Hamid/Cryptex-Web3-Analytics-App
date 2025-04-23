<a id="readme-top"></a>
<h1 align="center">
  <a href="https://github.com/Nijat-Hamid/Cryptex-Web3-Analytics-App"><img src="https://github.com/Nijat-Hamid/Cryptex-Web3-Analytics-App/blob/main/Demo/image/logo.png" alt="Cryptex" width="200"></a>
  <br>
  Cryptex
  <br>
</h1>

<h4 align="center">A comprehensive Web3 analytics application for iOS built with UIKit.</h4>

<p align="center">
  <a href="#introduction">Introduction</a> •
  <a href="#key-features">Key Features</a> •
  <a href="#tech-stack">Tech Stack</a> •
  <a href="#support">Support</a>
</p>

<br>
<p align="center">
  <img src="https://github.com/Nijat-Hamid/Cryptex-Web3-Analytics-App/blob/main/Demo/gif/demo.gif" alt="Cryptex" width="300">
</p>

## Introduction

`Cryptex` is a powerful Web3 analytics app for iOS built with UIKit that delivers comprehensive insights into popular DeFi protocols. Track Aave and Uniswap performance across all blockchains with real-time data on pools, tokens, prices, and transaction volumes—all in one intuitive mobile interface.

 Stay informed about the DeFi ecosystem with Cryptex's streamlined dashboard that provides essential metrics for informed decision-making, whether you're monitoring market trends or analyzing protocol activity.

## Key Features

* Multi-Protocol Support
  - View real-time data from top DeFi protocols like Aave and Uniswap
  - Unified analytics across all supported blockchains
* Comprehensive Pool & Token Insights
  - Explore every pool and token within supported protocols
  - Access detailed information including liquidity, volume, and token prices
* Powerful Charting
  - Interactive charts for price trends, volume, and historical data
  - Visualize key metrics with clarity and precision
* Dark/Light mode
* Live Analytics Across Chains
  - Aggregated data from multiple blockchains
  - Easily compare protocol performance across networks
* Performance-Optimized UIKit Interface
  - Native iOS experience built with UIKit
  - Smooth, responsive design tailored for iPhone users
* Privacy First
  - No data tracking or sharing

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Tech Stack

* Target and Language:
  - Minimum OS: iOS 18.2 
  - Swift 5
* Design Pattern and UI:
  - Model-View-ViewModel (MVVM) 
  - UIKit
* Network:
  - Combine framework based Network Manager with advanced error handling
* Testing:
  - Swift Testing Library
* Frameworks and etc:
  - Combine framework for reactivity
  - DGCharts for charting UI
  - SDWebImage for async image download
  - Snapkit for auto-layout
  - Full responsiveness with Snapkit and Constrains
  - Dependency injection for ViewModels
  - Geist custom font integration
  - Fade transition for navigation
  - SlideUp presentation for presenting VC
  - Animated Loading UI
  - Error screen for different states
  - "Source of Truth" and "Separation of Concerns" design principles applied
  - UserDefaults for user's chooses
  - Container based navigation
  - Tabbar, Picker, Unit Tests and etc.
  
<details>
<summary>
  Architecture
</summary> <br />
<pre>
```
.Cryptex
├─ Application                      # Main App
├─ Core
│  ├── Base                         # Base VC and VM for inheritance
│  │   ├── ViewControllers          # Base View Controllers for inheritance
│  │   └── ViewModels               # Base View Models for inheritance
│  ├── Components                   # Custom Components. Picker, Segment and Chart
│  ├── Constants                    # Global constans
│  ├── Extensions                   # Extensions
│  ├── Helpers                      # Helpers functions.Formatter, CATransitions and etc.
│  ├── Navigation                   # Base UINavigationController
│  ├── Network                      # Protocol and Combine based Network Manager and Network Endpoints
│  ├── Presentation+Transition      # Custom Transition and Presenter
│  └── Protocols                    # Protocols
├─ Resources
│  ├── Assets.xcassets              # Assets
│  └── Fonts                        # Custom Fonts
└─ Scenes
   ├── About                        # About Screen
   ├── Blockchains                  # Blockchain Screen
   ├── Blockchains Detail           # Blockchain Detail Screen
   ├── Container                    # Container for container-based navigation
   ├── DeFi                         # DeFi Choose Screen
   ├── Launch                       # Splash Screen with Storyboard
   ├── Loading Screen               # Loading Screen
   ├── Metrics                      # Metrics Screen
   ├── Overview                     # Overview Screen
   ├── Pools                        # Pools Screen
   ├── Pools Detail                 # Pool Detail Screen
   ├── TabBar                       # Tabbar Screen
   ├── Tokens                       # Tokens Screen
   └── Tokens Detail                # Token Detail Screen
```

</pre>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Support

If you like this project, its underlying philosophy, or appreciate my code as a developer, you can support me by giving it a star. This motivation will help me continue working on the project and deliver even better features in the future.  
  
## License

MIT License

Copyright 2025 Nijat Hamid <nicatorium@gmail.com>



