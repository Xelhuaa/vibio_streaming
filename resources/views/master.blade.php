<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title') | Watch Streaming Online</title>

    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('fontawesome-free/css/all.min.css') }}">
    <script src="{{ asset('js/jquery-3.7.1.min.js') }}"></script>
    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>

    <style>
        #searchCollapse {
            display: inline-block !important;
            width: 0;
            overflow: hidden;
            opacity: 0;
            transition: width 0.4s ease-in-out, opacity 0.3s ease-in-out;
            transform-origin: right center;
        }

        #searchCollapse.show {
            width: 200px;
            opacity: 1;
        }

        .logo-navbar {
            height: 50px;
            width: auto;
            object-fit: contain;
        }
    </style>
</head>

<body class="hold-transition sidebar-mini">

    <!-- Navbar -->
    <nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="{{ asset('logo-navbar.png') }}" alt="Vibio Logo" class="logo-navbar">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">
                            <i class="nav-icon fas fa-home"></i>
                            Home
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="nav-icon fas fa-film"></i>
                            Movies
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Most Watched</a></li>
                            <li><a class="dropdown-item" href="#">Quality</a></li>
                            <li><a class="dropdown-item" href="#">New Release</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="nav-icon fas fa-tv"></i>
                            TV Series
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Most Watched</a></li>
                            <li><a class="dropdown-item" href="#">Quality</a></li>
                            <li><a class="dropdown-item" href="#">New Release</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <form class="d-flex align-items-center" role="search">
                            <a class="btn btn-outline-success me-2" data-bs-toggle="collapse" href="#searchCollapse"
                                role="button" aria-expanded="false" aria-controls="searchCollapse">
                                <i class="fas fa-search"></i>
                            </a>
                            <div class="collapse" id="searchCollapse">
                                <input class="form-control" type="search" placeholder="Enter Movie Title..."
                                    aria-label="Search" />
                            </div>
                        </form>
                    </li>
                </ul>
                <!-- Tombol Login (buka modal) -->
                <a class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#authModal">
                    <i class="nav-icon fas fa-user"></i>
                    Login
                </a>
            </div>
        </div>
    </nav>

    <!-- Modal -->
    <div class="modal fade" id="authModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content p-4">

                <!-- LOGIN FORM -->
                <div id="loginForm">
                    <h4 class="text-center mb-4">Welcome back!</h4>
                    <form>
                        <div class="mb-3">
                            <label class="form-label text-uppercase small">Email Address</label>
                            <input type="email" class="form-control" placeholder="name@email.com">
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-uppercase small">Password</label>
                            <input type="password" class="form-control" placeholder="Password">
                        </div>
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        <button type="submit" class="btn btn-danger w-100">Login</button>
                    </form>
                    <div class="text-center mt-3">
                        Don’t have an account?
                        <a href="#" id="showRegister">Register</a>
                    </div>
                </div>

                <!-- REGISTER FORM -->
                <div id="registerForm" class="d-none">
                    <h4 class="text-center mb-4">Create an Account</h4>
                    <form>
                        <div class="mb-3">
                            <label class="form-label text-uppercase small">Your Name</label>
                            <input type="text" class="form-control" placeholder="Name">
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-uppercase small">Email Address</label>
                            <input type="email" class="form-control" placeholder="name@email.com">
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-uppercase small">Password</label>
                            <input type="password" class="form-control" placeholder="Password">
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-uppercase small">Confirm Password</label>
                            <input type="password" class="form-control" placeholder="Confirm Password">
                        </div>
                        <button type="submit" class="btn btn-danger w-100">Register</button>
                    </form>
                    <div class="text-center mt-3">
                        Have an account?
                        <a href="#" id="showLogin">Login</a>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Content -->
    <div class="wrapper">
        @yield('content')
    </div>
</body>

<script>
    document.getElementById("showRegister").addEventListener("click", function(e) {
        e.preventDefault();
        document.getElementById("loginForm").classList.add("d-none");
        document.getElementById("registerForm").classList.remove("d-none");
    });
    document.getElementById("showLogin").addEventListener("click", function(e) {
        e.preventDefault();
        document.getElementById("registerForm").classList.add("d-none");
        document.getElementById("loginForm").classList.remove("d-none");
    });
</script>

</html>
