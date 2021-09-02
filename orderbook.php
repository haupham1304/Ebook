<?php
require_once ('dbhelp.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Order Book</title>
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
				Quản lý thông tin đặt sách với nhà xuất bản
				<form method="get">
					<input type="text" name="s" class="form-control" style="margin-top: 15px; margin-bottom: 15px;" placeholder="Tìm kiếm theo tên nhà xuất bản">
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Publisher name</th>
                            <th>Order time</th>
                            <th>Staff ID</th>
						</tr>
					</thead>
					<tbody>
                        <?php
                        if (isset($_GET['s']) && $_GET['s'] != '') {
                            $sql = 'select * from orderbook where ONamePublisher like "%'.$_GET['s'].'%"
									order by OIDStaff ASC';
                        } else {
                            $sql = 'select * from orderbook
									order by OIDStaff ASC';
                        }
                        $studentList = executeResult($sql);

                        foreach ($studentList as $std) {
                            echo '<tr>
                                    <td>'.$std['ONamePublisher'].'</td>
                                    <td>'.$std['OrderedTime'].'</td>
                                    <td>'.$std['OIDStaff'].'</td>
                                </tr>';
                        }
                        ?>
					</tbody>
				</table>
				<button class="btn btn-success" onclick="window.open('addneworderbook.php', '_self')">Add</button>
                <button class="btn btn-success" onclick="window.open('index.php', '_self')">Home page</button>
			</div>
		</div>
	</div>

</body>
</html>