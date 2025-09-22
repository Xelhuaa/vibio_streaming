<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> @yield('title') | Watch Streaming Online</title>

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">

    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('js/jquery-3.7.1.min.js') }}"></script>
</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        @yield('content')
    </div>
</body>

</html>
