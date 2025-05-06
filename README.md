<h1>🎂 Ammas Pastries - E-commerce</h1>
  <p>A custom e-commerce application for ordering pastries and cakes, built on top of 
  </p>

  <h2>🚀 Features</h2>
  <ul>
    <li>Custom product options (e.g. image uploads for photo cakes)</li>
    <li>Contact form management in admin</li>
    <li>Exportable contact submissions via DataGrid</li>
    <li>Image preview and download on product pages</li>
    <li>Admin dashboard customization</li>
    <li>Laravel + Bagisto best practices</li>
  </ul>

  <h2>🛠 Tech Stack</h2>
  <ul>
    <li>PHP 8.3</li>
    <li>Laravel 10</li>
    <li>Bagisto (latest)</li>
    <li>MySQL</li>
    <li>MAMP, XAMPP (local dev)</li>
  </ul>

  <h2>🧑‍💻 Local Development Setup</h2>
  
    Clone the repo
    git clone https://github.com/rajtiwariens/ammaspastries.git
    
    cd ammaspastries
    Install dependencies
    composer install
    npm install && npm run dev

    Environment setup    
      cp .env.example .env
      php artisan key:generate

    Configure .env
      Set your database credentials and mail config.

    Run migrations and seeders
      php artisan migrate --seed

    Start the server
      php artisan serve
      Then visit: <a href="http://localhost:8000" target="_blank">http://localhost:8000</a>


  <h2>🧩 Customizations</h2>
  <ul>
    <li><code>ContactDataGrid</code> for managing customer inquiries</li>
    <li>Image upload for custom cakes (frontend + admin view)</li>
    <li>Export functionality using <code>x-admin::datagrid.export</code></li>
    <li>Admin theme overrides for localization and layout</li>
  </ul>

  <h2>📝 License</h2>
  <p>This project is licensed under the MIT License.</p>

  <hr>
  <p><em>Made with 💖 for custom cake lovers 🍰</em></p>
