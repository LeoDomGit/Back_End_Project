<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laravel</title>
        @viteReactRefresh
        @vite(['resources/css/app.css', 'resources/js/app.jsx'])
        @inertiaHead
        <meta name="csrf-token" content="{{ csrf_token() }}"> <!-- Add CSRF token meta tag -->
    </head>
    <body>
        @inertia
        <script>
             import axios from 'axios';
            const csrfToken = document.head.querySelector('meta[name="csrf-token"]').content;
            axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken;
        </script>
    </body>
</html>