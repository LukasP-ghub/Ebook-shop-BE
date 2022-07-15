# Table of Contents

- [About the Project](#about-the-project)
  * [Screenshots](#screenshots)
  * [Tech Stack](#tech-stack)
  * [Endpoints](#endpoints)
- [Getting Started](#getting-started)
  * [Installation](#installation)
  * [Run Locally](#run-locally)
 

<!-- About the Project -->
## About the Project
Very very early version.
Backend for ebook shop front-end project <a href="https://github.com/LukasP-ghub/WobClone">WobClone</a>.  

<!-- Screenshots -->
### Screenshots

<div align="center"> 
 <a href="https://ibb.co/kxrX0v2"><img src="https://i.ibb.co/R9McPdT/ebooks-get-All.jpg" alt="ebooks-get-All"></a>
</div>

<div align="center"> 
 <a href="https://ibb.co/5kN19dr"><img src="https://i.ibb.co/pQt1Pgf/ebooks-get-many.jpg" alt="ebooks-get-many"></a>
</div>

<div align="center"> 
  <a href="https://ibb.co/PT1PJjS"><img src="https://i.ibb.co/JxrG8th/ebooks-get-one.jpg" alt="ebooks-get-one"></a>
</div>

<!-- TechStack -->
### Tech Stack

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.typescriptlang.org/">Typescript</a></li>
    <li><a href="https://expressjs.com/">Express.js</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.mysql.com/">MySQL</a></li>
  </ul>
</details>

<!-- Endpoints -->
### Endpoints

- /ebooks
- /ebooks/get-many
  - <em>available query parameters:</em> 
    - key= title | author_id | author_name  <em>title default</em>
    - phrase <em>id or title/partly title</em>
    - maxPrice
    - minPrice 
- /ebooks/get-one
  - <em>available query parameters:</em> 
    - ebook_id

<!-- Env Variables -->
### Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`HOST`="localhost"
`USER`="root"
`PASSWORD`=""
`DATABASE`="ebook-store"

## Getting Started
   
### Run Locally

Clone the project

```bash
  git clone https://github.com/LukasP-ghub/WobClone-BE.git
```

Go to the project directory

```bash
  cd my-project
```

Install dependencies

```bash
  npm install
```

Import database

Start the server

```bash
  npm start
```

