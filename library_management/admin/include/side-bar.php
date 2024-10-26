<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sidebar with Dropdowns</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    /* Sidebar Styling */
    .sidebar {
      width: 250px;
      background-color: #4B607E;
      padding: 0;
      color: white;
    }

    .nav-item {
      list-style-type: none;
      margin: 0;
    }

    .nav-link {
      text-decoration: none;
      color: black;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 15px;
      background-color: #4B607E;
      border: none;
      width: 100%;
      cursor: pointer;
      text-align: left;
      font-size: 16px;
    }

    /* .nav-link:hover {
      background-color: #3A4D67;
    } */

    .dropdown-menu {
      display: none;
      background-color: #3A4D67;
      padding-left: 20px;
    }

    .dropdown-item {
      display: block;
      padding: 8px 0;
      color: white;
      text-decoration: none;
    }

    .dropdown-item:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <!-- Sidebar -->
  <ul class="sidebar navbar-nav">
    <!-- Manage Books -->
    <li class="nav-item dropdown">
      <a class="nav-link" href="javascript:void(0);" onclick="toggleDropdown('bookDropdown')"style="color: white;">
        <i class="fa fa-book"></i>
        <span>Manage Books</span>
        <i class="fas fa-chevron-down"></i>
      </a>
      <div class="dropdown-menu" id="bookDropdown">
        <a class="dropdown-item" href="add-book.php">Add Book</a>
        <a class="dropdown-item" href="view-book.php">View Books</a>
      </div>
    </li>

    <!-- Manage Category -->
    <li class="nav-item dropdown">
      <a class="nav-link" href="javascript:void(0);" onclick="toggleDropdown('categoryDropdown')"style="color: white;">
        <i class="fa fa-list-alt"></i>
        <span>Manage Category</span>
        <i class="fas fa-chevron-down"></i>
      </a>
      <div class="dropdown-menu" id="categoryDropdown">
        <a class="dropdown-item" href="add-category.php">Add Category</a>
        <a class="dropdown-item" href="view-category.php">View Categories</a>
      </div>
    </li>

    <!-- Book Issue Requests -->
    <li class="nav-item dropdown">
        <a class="nav-link " href="issue-request.php" style="color: white;">
          <i class="fa fa-book"></i>
          <span>Book issue requests</span>
        </a>
    </li>

    <!-- Manage Place -->
    <li class="nav-item dropdown">
      <a class="nav-link" href="javascript:void(0);" onclick="toggleDropdown('placeDropdown')"style="color: white;">
        <i class="fa fa-map-marker"></i>
        <span>Manage Place</span>
        <i class="fas fa-chevron-down"></i>
      </a>
      <div class="dropdown-menu" id="placeDropdown">
        <a class="dropdown-item" href="add-place.php">Add Place</a>
        <a class="dropdown-item" href="view-place.php">View Places</a>
      </div>
    </li>

    <!-- Manage Users -->
    <li class="nav-item dropdown">
      <a class="nav-link" href="javascript:void(0);" onclick="toggleDropdown('manageuserDropdown')"style="color: white;">
        <i class="fa fa-user"></i>
        <span>Manage Users</span>
        <i class="fas fa-chevron-down"></i>
      </a>
      <div class="dropdown-menu" id="manageuserDropdown">
        <a class="dropdown-item" href="add-users.php">Add User</a>
        <a class="dropdown-item" href="view-users.php">View Users</a>
      </div>
    </li>
  </ul>

  <!-- JavaScript for toggling dropdowns -->
  <script>
    function toggleDropdown(dropdownId) {
      var dropdown = document.getElementById(dropdownId);
      if (dropdown.style.display === "none" || dropdown.style.display === "") {
        dropdown.style.display = "block";
      } else {
        dropdown.style.display = "none";
      }
    }
  </script>

</body>
</html>
