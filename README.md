# UniMall - Flutter Shopping App

## Overview
UniMall is a modern Flutter-based e-commerce application designed to provide a seamless shopping experience. The app features an intuitive interface with category browsing, product displays, and a shopping cart system. The application is currently under development with several working pages and features in place, while others are still in progress.

## Current Features
- **Category Navigation**: Browse through different product categories via an intuitive sidebar menu
- **Product Display**: View products organized by category with images, names, and prices
- **Featured Items**: Horizontally scrolling display of featured items for each category
- **Shopping Bag**: Manage selected items with quantity controls and pricing information
- **Checkout Flow**: Basic checkout functionality with order confirmation

## Pages
### 1. Homepage (`Homepage` class)
The main landing page showing categories and products:
- Left sidebar for category navigation (Jewelry, Top, Lower Body, Shoes, Combo)
- Feature display with horizontally scrolling promotional categories
- Product grid showing items filtered by selected category
- Note: Currently using placeholder images (the app will display fallback icons until actual images are added)

### 2. Shopping Bag (`Orderhire` class)
Shopping cart page with the following features:
- List of items added to cart with details
- Quantity adjustment controls with availability indicators
- Item removal functionality
- Price summary and checkout button
- Currency display in Kenyan Shillings (KSh)

### 3. Profile Page (Not Complete)
This page is planned but not yet implemented. It will include:
- User profile information
- Order history
- Account settings
- Payment methods

## Development Status
⚠️ **Work in Progress**

The app is still under active development. Current limitations include:
- Placeholder images instead of actual product images
- Limited backend integration
- Profile page not yet implemented
- Some UI elements still need refinement
- Navigation between pages needs additional work

## Technical Details
- Built with Flutter for cross-platform compatibility
- Uses StatefulWidget for state management
- Implements Material Design components
- Organized data models for product information

## Next Steps
- Complete the Profile page implementation
- Add actual product images to replace placeholders
- Implement user authentication
- Connect to backend services
- Add payment processing integration
- Enhance UI/UX with animations and transitions
- Implement search functionality

## Getting Started
1. Make sure you have Flutter installed
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to launch the app

## Dependencies
- Flutter SDK
- Material Design components
- Image assets (to be added)

