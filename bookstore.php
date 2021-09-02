<?php
require_once ('dbhelp.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Book Store</title>
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
				Quản lý thông tin các hiệu sách
				<form method="get">
					<input type="text" name="s" class="form-control" style="margin-top: 15px; margin-bottom: 15px;" placeholder="Tìm kiếm theo tên hoặc địa chỉ hiệu sách">
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
                            <th>Store ID</th>
                            <th>Store name</th>
							<th>Store address</th>
                            <th>Store phone</th>
                            <th>Store email</th>
							<th width="60px"></th>
						</tr>
					</thead>
					<tbody>
                        <?php
                        if (isset($_GET['s']) && $_GET['s'] != '') {
                            $sql = 'select * from bookstorage where NameStorage like "%'.$_GET['s'].'%" OR AddressStorage like "%'.$_GET['s'].'%"';
                        } else {
                            $sql = 'select * from bookstorage';
                        }
                        $studentList = executeResult($sql);

                        foreach ($studentList as $std) {
                            echo '<tr>
                                    <td>'.$std['IDStorage'].'</td>
                                    <td>'.$std['NameStorage'].'</td>
                                    <td>'.$std['AddressStorage'].'</td>
                                    <td>'.$std['PhoneStorage'].'</td>
                                    <td>'.$std['EmailStorage'].'</td>
									<td><button class="btn btn-warning" onclick=\'window.open("modifybookstore.php?id='.$std['IDStorage'].'","_self")\'>Edit</button></td>
								</tr>';
                        }
                        ?>
					</tbody>
				</table>
				<button class="btn btn-success" onclick="window.open('addnewbookstore.php', '_self')">Add</button>
                <button class="btn btn-success" onclick="window.open('index.php', '_self')">Home page</button>
			</div>
		</div>
	</div>

</body>
</html>