

  <h1>🎂 Ammas Pastries -E-commerce</h1>
  <p>A custom e-commerce application for ordering pastries and cakes, built on top of <a href="[https://bagisto.com](https://ammaspastries.in" target="_blank">ammaspastries</a> — a Laravel-based eCommerce framework.</p>

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
    <li>MAMP,Xammp (local dev)</li>
  </ul>

  <h2>🧑‍💻 Local Development Setup</h2>
  <ol>
    <li><strong>Clone the repo</strong>
      <pre><code>git clone https://github.com/rajtiwariens/ammaspastries.git
cd ammaspastries</code></pre>
    </li>

    Install dependencies
      composer install
npm install &amp;&amp; npm run dev

    Environment setup</strong>
      cp .env.example .env
      php artisan key:generate

    Configure <code>.env
      Set your database credentials and mail config.

   Run migrations and seeders
   php artisan migrate --seed

    <li><strong>Start the server</strong>
      <pre><code>php artisan serve</code></pre>
      Then visit: <a href="http://localhost:8000" target="_blank">http://localhost:8000</a>
    </li>
  </ol>

  <h2>🧩 Customizations</h2>
  <ul>
    <li><code>ContactDataGrid</code> for managing customer inquiries</li>
    <li>Image upload for custom cakes (frontend + admin view)</li>
    <li>Export functionality using <code>x-admin::datagrid.export</code></li>
    <li>Admin theme overrides for localization and layout</li>
  </ul>

  
  <p>This project is licensed under the MIT License.</p>

  <hr>
  <p><em>Made with 💖 for custom cake lovers 🍰</em></p>
