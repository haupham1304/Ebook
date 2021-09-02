<?php
require_once ('dbhelp.php');
	$s_id = $s_name = $s_address = $s_email = $s_phone = '';

	if (!empty($_POST)) {

		$error = array();

		$sql = 'select * from bookstorage where IDStorage =' .$_POST['id'];
    	$storeList = executeResult($sql);
		if ($storeList != NULL) {
        	$error['IDStore'] = "Mã hiệu sách bạn chọn không tồn tại trên hệ thống";
        	echo '<script type="text/javascript">alert("Mã hiệu sách bạn chọn không tồn tại trên hệ thống")</script>';
    	}
		
		if (isset($_POST['id'])) {
			$s_id = $_POST['id'];
		}
	
		if (isset($_POST['name'])) {
			$s_name = $_POST['name'];
		}
	
		if (isset($_POST['address'])) {
			$s_address = $_POST['address'];
		}
	
		if (isset($_POST['email'])) {
			$s_email = $_POST['email'];
		}
	
		if (isset($_POST['phone'])) {
			$s_phone = $_POST['phone'];
		}
		
		$s_id       = str_replace('\'', '\\\'', $s_id);
		$s_name     = str_replace('\'', '\\\'', $s_name);
		$s_address  = str_replace('\'', '\\\'', $s_address);
		$s_email    = str_replace('\'', '\\\'', $s_email);
		$s_phone    = str_replace('\'', '\\\'', $s_phone);

		if (empty($error)) {
			$sql = "insert into bookstorage(EmailStorage, PhoneStorage, NameStorage, AddressStorage, IDStorage) value('$s_email', '$s_phone', '$s_name', '$s_address', '$s_id')";
			execute($sql);
			header('Location: bookstore.php');
			die();
		}
	
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Add New Storage</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2 class="text-center">Thêm hiệu sách mới</h2>
			</div>
			<div class="panel-body">
				<form method="post">
					<div class="form-group">
					  <label for="mnv">Store ID:</label>
					  <input required="true" type="text" class="form-control" id="mnv" name="id">
					</div>
                    <div class="form-group">
					  <label for="user">Store name:</label>
					  <input required="true" type="text" class="form-control" id="user" name="name">
					</div>
                    <div class="form-group">
					  <label for="address">Address:</label>
					  <input type="text" class="form-control" id="address" name="address">
					</div>
                    <div class="form-group">
					  <label for="email">Email:</label>
					  <input type="text" class="form-control" id="email" name="email">
					</div>
					<div class="form-group">
					  <label for="phone">Phone number:</label>
					  <input type="text" class="form-control" id="phone" name="phone">
					</div>
					<button class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>