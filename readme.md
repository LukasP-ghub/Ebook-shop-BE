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
  <img src="https://drive.google.com/file/d/1OWD-orODY279vRoUR6lqhx3E5Nn9hIYD/view?usp=sharing" alt="screenshot" />
  <em>All ebooks</em>
</div>

<div align="center"> 
  <img src="https://drive.google.com/file/d/1cDcUgeDeUrRCiVT1Zim3i2TQH0_mulGC/view?usp=sharing" alt="screenshot" />
  <em>Ebooks by query</em>
</div>

<div align="center"> 
  <img src="https://drive.google.com/file/d/1RuxrsiCEJY8FJ8IeUZoc5M73bfRZ34So/view?usp=sharing" alt="screenshot" />
  <em>Ebook by id</em>
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

<!-- Features -->
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

Start the server

```bash
  npm start
```

