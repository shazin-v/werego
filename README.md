# Werego - Electric Vehicle Charging Station Finder

## Overview

The advent of electric vehicles (EVs) has ushered in a new era of eco-friendly and sustainable transportation. However, a significant challenge faced by EV owners is the availability of charging infrastructure. To address this issue, Werego is an innovative web-based system that empowers EV owners to locate, access, and reserve charging stations conveniently.

### Key Features

- **Charging Station Search:** Quickly find nearby charging stations by selecting your location from a list. Get detailed information about available stations, including address, city, charge type, and available slots.

- **Charging Station Details:** View comprehensive information about each charging station, making it easy to choose the most suitable one for your needs.

- **Slot Booking:** Reserve available charging slots at your preferred station. Manage your bookings, and even cancel them if your plans change.

- **User Management:** Create an account, log in, and access your booking history. User-friendly features like password reset and email verification enhance your experience.

- **Admin Panel:** Charging station operators can manage their stations and slots effortlessly through the admin panel. This feature allows operators to add or remove charging stations, update station details, and review booking history.

## Prerequisites

Ensure you have the following software and tools installed:

- **Technology:** Python
- **Integrated Development Environment (IDE):** VSCode (or any preferred Python IDE)
- **Framework:** Flask
- **Database:** MySQL

## Installation

Follow these steps to set up Werego on your local machine:

1. **Clone the Repository:**

   ```bash
   https://github.com/shazin-v/werego.git
   cd werego
   ```

2. **Set Up a Virtual Environment:**

   ```bash
   python -m venv venv
   venv\Scripts\activate # On powershell:
   ```

3. **Install Required Packages:**

   ```bash
   pip install -r requirements.txt
   ```

4. **Database Setup:**

      - Install XAMPP:

      Download and install XAMPP from the official website.
      - Start the XAMPP Control Panel.
      Start the Apache and MySQL services.
      Install MySQL Workbench:

      Download and install MySQL Workbench from the official website.
      - Open MySQL Workbench and create a new connection:
      Connection Name: Localhost
      Hostname: localhost
      Port: 3306 (or the port you have configured for MySQL)
      Username: root
      Password: admin 

      Open MySQL and create a database for Werego (e.g., ev_db).
      Update the database credentials in the project's configuration file to match your local MySQL setup.
      Use the provided SQL file (if available) or manually create tables for booking, user, admin, and any other required entities based on the project’s models.

5. **Run the Application:**

   ```bash
   python app.py
   ```

6. **Access the Application:**

Open your browser and navigate to http://127.0.0.1:5000 to start using Werego.

## Usage

Start the Application: Launch the Werego application.

Search for Charging Stations: Use the search feature to find charging stations near you.

View Station Details: Click on a station to view its details.

Book a Charging Slot: Reserve an available slot at your chosen station.

Admin Features: If you are a charging station operator, log in to the admin panel to manage your stations and slots.

## screenshots

Home Page

![Screenshot 1](screenshot/common/homepage.png)

## Admin - Page

![Screenshot 1](screenshot/admin/dashboard.png)
Admin Dashboard

![Screenshot 2](screenshot/admin/manage_station.png)
Managing station

![Screenshot 1](screenshot/admin/view_bookings.png)
View booking

![Screenshot 2](screenshot/admin/view_feedback.png)
Manage feedback

![Screenshot 2](screenshot/admin/view_user.png)
Manage users

## User - page

![Screenshot 1](screenshot/user/dashboard.png)
User Dashboard

![Screenshot 2](screenshot/user/profile.png)
User Profile Update

![Screenshot 1](screenshot/user/station_search.png)
Searching Nearby Station

![Screenshot 2](screenshot/user/booking_page.png)
Booking Page

## Contributing

We welcome contributions from the community to improve Werego. To contribute:

1. **Fork the repository.**
2. **Create a new branch** for your feature or bug fix.
3. **Commit your changes** and push them to your fork.
4. **Submit a pull request** to the main repository.

### Future Plans

I will be converting Werego to use Next.js, React, TypeScript, Tailwind CSS, MongoDB, FastAPI, Express, Node.js, GraphQL, and Jest. The deployment will be done on Vercel. Feel free to create a fork and implement features or enhancements using these technologies!

```

```
