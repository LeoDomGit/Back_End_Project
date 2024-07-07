<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laravel</title>
        @viteReactRefresh
        @vite(['resources/css/app.css', 'resources/js/app.jsx'])
        @inertiaHead
        <meta name="csrf-token" content="{{ csrf_token() }}"> 
        <script src="{{ asset('ckeditor/ckeditor.js') }}"></script>
    </head>
    <body>
        @inertia
        <script>
            const csrfToken = document.head.querySelector('meta[name="csrf-token"]').content;
        </script>
    </body>
</html>
