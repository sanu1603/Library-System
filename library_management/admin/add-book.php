<?php
session_start();
include ('../connection.php');
$name = $_SESSION['name'];
$id = $_SESSION['id'];
if(empty($id)) {
    header("Location: index.php"); 
    exit();
}

if(isset($_REQUEST['sbt-book-btn'])) {
    // Retrieve and escape input values
    $book_name = mysqli_real_escape_string($conn, $_POST['book_name']);
    $category_name = mysqli_real_escape_string($conn, $_POST['category_name']);
    $isbn = mysqli_real_escape_string($conn, $_POST['isbn']);
    $author_name = mysqli_real_escape_string($conn, $_POST['author_name']);
    $publisher_name = mysqli_real_escape_string($conn, $_POST['publisher_name']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);
    $quantity = mysqli_real_escape_string($conn, $_POST['quantity']);
    $location_name = mysqli_real_escape_string($conn, $_POST['location_name']);
    $availability = mysqli_real_escape_string($conn, $_POST['availability']);

    // Use prepared statements to insert data
$stmt = $conn->prepare("INSERT INTO book (book_name, category, isbnno, author, publisher, price, quantity, place, availability) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("sssssdisi", $book_name, $category_name, $isbn, $author_name, $publisher_name, $price, $quantity, $location_name, $availability);

// Execute the prepared statement
if ($stmt->execute()) {
    ?>
    <script type="text/javascript">
        alert("Book added successfully.");
    </script>
    <?php
} else {
    echo "Error: " . $stmt->error; // Display error message
}

// Close the statement
$stmt->close();
}
?>

<?php include('include/header.php'); ?>
<div id="wrapper">
    <?php include('include/side-bar.php'); ?>

    <div id="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Add Book</a>
                </li>
            </ol>

            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-info-circle"></i>
                    Submit Book Details
                </div>

                <form method="post" class="form-valide">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="item">Book Name <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <input type="text" name="book_name" id="book_name" class="form-control" placeholder="Enter Book Name" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="leave-type">Category <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <select class="form-control" id="category_name" name="category_name" required>
                                    <option value="">Select Category</option>
                                    <?php 
                                    $fetch_category = mysqli_query($conn, "SELECT * FROM category WHERE status=1");
                                    while($row = mysqli_fetch_array($fetch_category)){
                                    ?>
                                    <option><?php echo $row['category_name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>    
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="price">ISBN <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <input type="text" name="isbn" id="isbn" class="form-control" placeholder="Enter ISBN" required>
                            </div>
                        </div>     
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="price">Author <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <input type="text" name="author_name" id="author_name" class="form-control" placeholder="Enter Author Name" required>
                            </div>
                        </div> 
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="price">Publisher <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <input type="text" name="publisher_name" id="publisher_name" class="form-control" placeholder="Enter Publisher Name" required>
                            </div>
                        </div> 
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="price">Price <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <input type="text" name="price" id="price" class="form-control" placeholder="Enter Price" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="price">Quantity <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <input type="text" name="quantity" id="quantity" class="form-control" placeholder="Enter Quantity" required>
                            </div>
                        </div>                                         
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="leave-type">Location <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <select class="form-control" id="location_name" name="location_name" required>
                                    <option value="">Select Location</option>
                                    <?php 
                                    $fetch_location = mysqli_query($conn, "SELECT * FROM location WHERE status=1");
                                    while($row = mysqli_fetch_array($fetch_location)){
                                    ?>
                                    <option><?php echo $row['name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-4 col-form-label" for="status">Availability <span class="text-danger">*</span></label>
                            <div class="col-lg-6">
                                <select class="form-control" id="availability" name="availability" required>
                                    <option value="">Select Status</option>
                                    <option value="1">Available</option>
                                    <option value="0">Not Available</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-8 ml-auto">
                                <button type="submit" name="sbt-book-btn" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
 
<?php include('include/footer.php'); ?>
