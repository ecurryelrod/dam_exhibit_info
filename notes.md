- user asked if they would like to see current or coming soon exhibits
- user sees exhibits names, dates, and subtitle for either current or coming soon 
- user can select an exhibit to get a more detailed description
- user has the option to return to the previoud menu or the root menu
- user has option to exit program at any time.

Classes
    - Exhibits
    - CLI
    - Scraper

CLI Class Flow
    - Welcome user to the app
    - Please select a number below to see current exhibits or upcoming exhibits
    - To exit the program type 'exit'
        1. Current Exhibits
        2. Upcoming Exhibits
    - if user selects 1, should be directed to another menu with all current exhibits: name, date, and subtitle of each one
    - prompt user for more input
    - Please select a number below to see a detailed description of an exhibit
    - To go back to the root menu type 'root'
    - To exit the program type 'exit'
        1. Exhibit 1 - subtitle
        2. Exhibit 2 - subtitle
        3. etc
    - if user selects 2, should be directed to another menu with all upcoming exhibits: name, date, and subtitle of each one
    - prompt user for more input
    - Please select a number below to see a detailed description of an exhibit
    - To go back to the root menu type 'root'
    - To exit the program type 'exit'
        1. Exhibit 1 - subtitle
        2. Exhibit 2 - subtitle
        3. etc
    - If user selects a number, should be given detailed information description of that single exhibit.
    - Here are the details of ' ' exhibit
        - list dates of exhibit 
        - description text
    - Ask user if they would like to go back to the previous menu or the root menu.
    - To exit the program type 'exit'

Exhibit Class Flow
    - should have attr_accessors 
    - have class variable to store all exhibit instances
    - get initialized with those attr_accessors
    - have save instance method
    - have all class method
    - have a way to pull from the already existing scraped? exhibits 
    - have a way to find the scraped exhibits 
    