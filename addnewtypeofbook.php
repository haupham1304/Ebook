<?php
require_once ('dbhelp.php');

	$s_sid = $s_type = '';

	if (!empty($_POST)) {

		$error = array();

		$sql = 'select * from bookstorage where IDStorage =' .$_POST['sid'];
    	$storeList = executeResult($sql);
		if ($storeList == NULL) {
        	$error['IDStorage'] = "Mã hiệu sách bạn chọn không tồn tại trên hệ thống";
        	echo '<script type="text/javascript">alert("Mã hiệu sách bạn chọn không tồn tại trên hệ thống")</script>';
    	}

		if (isset($_POST['sid'])) {
			$s_sid = $_POST['sid'];
		}
	
		if (isset($_POST['type'])) {
			$s_type = $_POST['type'];
		}
		
		$s_sid    = str_replace('\'', '\\\'', $s_sid);
		$s_type   = str_replace('\'', '\\\'', $s_type);

		if (empty($error)) {
			$sql = "insert into storagetypebook(TIDStorage, TypeBook) value('$s_sid', '$s_type')";
			execute($sql);
			header('Location: typeofbook.php');
			die();
		}
	
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Add New Book Type</title>
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
				<h2 class="text-center">Thêm loại sách mới</h2>
			</div>
			<div class="panel-body">
				<form method="post">
					<div class="form-group">
					  <label for="mnv">Storage ID:</label>
					  <input required="true" type="text" class="form-control" id="mnv" name="sid">
					</div>
                    <div class="form-group">
					  <label for="user">Book Type:</label>
					  <input required="true" type="text" class="form-control" id="user" name="type">
					</div>
					<button class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>