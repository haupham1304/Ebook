<?php
require_once ('dbhelp.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Staff and Publisher</title>
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
				Hiển thị thông tin nhân viên đã đặt sách từ các nhà xuất bản
				<form method="get">
					<input type="text" name="s" class="form-control" style="margin-top: 15px; margin-bottom: 15px;" placeholder="Tìm kiếm theo tên nhà xuất bản">
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Full name</th>
							<th>Email</th>
                            <th>Phone number</th>
                            <th>Store ID</th>
                            <th>Publisher name</th>
                            <th>Order time</th>
						</tr>
					</thead>
					<tbody>
                        <?php
                        if (isset($_GET['s']) && $_GET['s'] != '') {
                            $sql = 'SELECT staff.IDStaff, staff.Fname, staff.Mname, staff.Lname,staff.EmailStaff, staff.PhoneStaff, staff.SIDStorage, orderbook.ONamePublisher, orderbook.OrderedTime
                                    FROM ebook.staff, ebook.orderbook
                                    WHERE staff.IDStaff = orderbook.OIDStaff AND orderbook.ONamePublisher like "%'.$_GET['s'].'%"
                                    ORDER BY staff.IDStaff ASC';
                        } else {
                            $sql = 'SELECT staff.IDStaff, staff.Fname, staff.Mname, staff.Lname,staff.EmailStaff, staff.PhoneStaff, staff.SIDStorage, orderbook.ONamePublisher, orderbook.OrderedTime
                                    FROM ebook.staff, ebook.orderbook
                                    WHERE staff.IDStaff = orderbook.OIDStaff
                                    ORDER BY staff.IDStaff ASC';
                        }
                        $studentList = executeResult($sql);

                        foreach ($studentList as $std) {
                            echo '<tr>
                                    <td>'.$std['IDStaff'].'</td>
                                    <td>'.$std['Fname'].' '.$std['Mname'].' '.$std['Lname'].'</td>
                                    <td>'.$std['EmailStaff'].'</td>
                                    <td>'.$std['PhoneStaff'].'</td>
                                    <td>'.$std['SIDStorage'].'</td>
                                    <td>'.$std['ONamePublisher'].'</td>
                                    <td>'.$std['OrderedTime'].'</td>
                                </tr>';
                        }
                        ?>
					</tbody>
				</table>
                <button class="btn btn-success" onclick="window.open('index.php', '_self')">Home page</button>
			</div>
		</div>
	</div>
</body>
</html>